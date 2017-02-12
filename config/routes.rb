Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'emposeats#index'

  get '/graph/24hr', to: 'graph#twentyfourhr'
  get '/graph/minutes', to: 'graph#minutes'
  get '/graph/hours', to: 'graph#hours'
  get '/graph/days', to: 'graph#days'
  get '/graph/future_hours', to: 'graph#future_hours'
  get '/graph/future_days', to: 'graph#future_days'

  mount ActionCable.server => '/cable'
  get '/test', to: 'emposeats#test'
end
