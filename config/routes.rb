Nathan::Application.routes.draw do
  root :to => 'root#landing'

  controller :root do
    get 'landing'
    get 'about'
  end

  resources :feedbacks, :only => :new
  match '/contact' => 'feedbacks#new', :via => :get, :as => :contact
end
