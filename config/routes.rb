Rails.application.routes.draw do

  mount Resque::Server.new, :at => "/resque"
  root 'entries#index'
  resources :feeds
  resources :entries
  patch '/entry/:id/toggle_like' => 'entries#toggle_like', :as => 'toggle_like'

end
