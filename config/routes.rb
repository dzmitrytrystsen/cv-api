Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resumes
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
  post 'user/create', to: 'user#create'
end
