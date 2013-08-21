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
      resources :items, :except => [:index] do
        resources :photos, :only => [:destroy] do
          post :make_active, :on => :member
        end
      end
    end
  end

  resource :collection, :only => [:show] do
    resources :items, :only => [:show]
  end
end
