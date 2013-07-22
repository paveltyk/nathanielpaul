Nathan::Application.routes.draw do
  root :to => 'root#landing'

  controller :root do
    get 'landing'
    get 'about'
  end

  match '/contact' => 'feedbacks#new', :via => :get, :as => :new_feedback
  match '/contact' => 'feedbacks#create', :via => :post

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'

    resources :collections do
      resources :items do
        resources :photos, :only => [:create, :destroy]
      end
    end
  end
end
