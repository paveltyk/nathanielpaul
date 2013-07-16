Nathan::Application.routes.draw do
  root :to => 'root#landing'

  controller :root do
    get 'landing'
    get 'about'
  end

  match '/contact' => 'feedbacks#new', :via => :get, :as => :new_feedback
  match '/contact' => 'feedbacks#create', :via => :post
end
