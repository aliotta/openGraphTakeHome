class OpenGraphController < ApplicationController
    def open_graph
    end
    def submit_url
        require 'open-uri'
        puts "URL Submitted"
        Thread.new do
            Rails.application.executor.wrap do
                page = Nokogiri::HTML(open(params[:url]))
                puts page
                metatag = page.at('meta[property="og:image"]')
                if metatag and metatag['content']
                    ActiveRecord::Base.connection.execute("INSERT INTO open_graph_image (url) values ('#{ActiveRecord::Base.sanitize_sql(metatag['content'])}');")
                else
                    puts "not found"
                end
                #extract_metadata(dom, "og:image")
            end
        end
    end
end
