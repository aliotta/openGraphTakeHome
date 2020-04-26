class OpenGraphController < ApplicationController
    def open_graph
        puts "Honey, I'm home!"
    end
    def submit_url
        puts "URL Submitted"
        puts params
    end
end
