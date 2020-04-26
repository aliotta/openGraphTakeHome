class OpenGraphController < ApplicationController
    def open_graph
        puts "Honey, I'm home!"
    end
    def submit_url
        require 'net/http'
        puts "URL Submitted"
        puts params
        Thread.new do
            Rails.application.executor.wrap do
                dom = get_url(params[:url])
                puts dom
            end
        end
    end

    def get_url (uri_str, limit = 10) 
        url = URI.parse(uri_str)
        puts url

        req = Net::HTTP::Get.new(url.to_s)
        response = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        case response
        when Net::HTTPSuccess     then response.body
        when Net::HTTPRedirection then get_url(response['location'], limit - 1)
        else
            response.error!
        end
    end
    

end
