Nathan::Application.routes.draw do
  root :to => 'root#landing'

  controller :root do
    get 'landing'
    get 'about'
  end
end
