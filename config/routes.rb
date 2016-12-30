# frozen_string_literal: true
Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  scope 'api' do
    namespace :v1 do
    	resources :users, except: [:new, :edit]
      resources :messages, only: [:index, :create]
      post 'authenticate'   =>  'users#authenticate_user'
    end
  end
  get '*path', to: redirect('/', path: '?%{path}')
end
