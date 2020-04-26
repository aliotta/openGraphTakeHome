class OpenGraphController < ApplicationController
    def open_graph
        puts "Honey, I'm home!"
    end
    def submit_url
        require 'open-uri'
        puts "URL Submitted"
        puts params
        Thread.new do
            Rails.application.executor.wrap do
                #dom = get_url(params[:url])
                #puts dom
                page = Nokogiri::HTML(open(params[:url]))   
                puts page
                #extract_metadata(dom, "og:image")
            end
        end
    end
end
