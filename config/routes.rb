Rails.application.routes.draw do


  scope path: '/api' do
    resources :tasks
    resources :jobs
    resources :users
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
