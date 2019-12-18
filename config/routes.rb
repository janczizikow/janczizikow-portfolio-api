Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
              path: 'api/v1/auth',
              path_names: {
                'sign_in': 'login',
                'sign_out': 'logout'
              },
              defaults: {
                format: :json
              }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :submissions, only: %i[index show create destroy]
      resources :projects, only: %i[index show create update destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v2 do
      resources :projects, only: %i[index show create update destroy]
    end
  end

  match "*path", to: "errors#catch_404", via: :all
end
