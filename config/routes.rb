Camp::Application.routes.draw do

  resources :session, only: [:create, :destroy]

  resources :user, only: [:create] do
    collection do
      get 'check_email'
    end
  end

end
