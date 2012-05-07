PhoenixProvider::Application.routes.draw do

  resources :oauth_clients
  devise_for :users
  resources :users, :only => [:show, :index]

  match '/oauth/test_request',  :to => 'oauth#test_request',  :as => :test_request
  match '/oauth/token',         :to => 'oauth#token',         :as => :token
  match '/oauth/access_token',  :to => 'oauth#access_token',  :as => :access_token
  match '/oauth/request_token', :to => 'oauth#request_token', :as => :request_token
  match '/oauth/authorize',     :to => 'oauth#authorize',     :as => :authorize
  match '/oauth',               :to => 'oauth#index',         :as => :oauth

  authenticated :user do
    root :to => "oauth_clients#index"
  end
  root :to => "home#index"
end
