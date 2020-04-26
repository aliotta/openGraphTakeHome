class OpenGraphController < ApplicationController
    def open_graph
    end
    def submit_url
        require 'open-uri'
        Thread.new do
            Rails.application.executor.wrap do
                page = Nokogiri::HTML(open(params[:url]))
                puts page
                metatag = page.at('meta[property="og:image"]')
                if metatag and metatag['content']
                    begin
                        ActiveRecord::Base.connection.execute("INSERT INTO open_graph_image (url) values ('#{ActiveRecord::Base.sanitize_sql(metatag['content'])}');")
                        puts "Image processing in progress"
                        sleep 1;
                        #processing image
                        ActiveRecord::Base.connection.execute("UPDATE open_graph_image SET status = 'processed' where url = '#{ActiveRecord::Base.sanitize_sql(metatag['content'])}';")
                        ActionCable.server.broadcast "open_image_processing_channel", { status: "processed", url: metatag['content']}
                    rescue StandardError => e
                        ActionCable.server.broadcast "open_image_processing_channel", { status: "error", message: "There was an error processing your image"}
                    end
                    
                else
                    ActionCable.server.broadcast "open_image_processing_channel", { status: "error", message: "No og:image found for that url"}
                end
            end
        end
    end
end
