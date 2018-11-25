Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :cards
  end

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
