class OpenGraphController < ApplicationController
    def open_graph
    end
    def submit_url
        require 'open-uri'
        puts "URL Submitted"
        Thread.new do
            Rails.application.executor.wrap do
                page = Nokogiri::HTML(open(params[:url]))

                metatag = page.at('meta[name="og:image"]')
                if metatag then puts metatag['content']
                else
                    puts "not found"
                end
                #extract_metadata(dom, "og:image")
            end
        end
    end
end
