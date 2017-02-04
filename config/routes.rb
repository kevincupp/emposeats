Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'emposeats#index'

  mount ActionCable.server => '/cable'
  get '/test', to: 'emposeats#test'
end
