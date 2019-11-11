Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resumes
    end
  end

  post 'auth/login', to: 'users#login'
  post 'users/create', to: 'users#create'
end
