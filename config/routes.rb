Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'open_graph#open_graph'

  post '/url', to: 'open_graph#submit_url'
end
