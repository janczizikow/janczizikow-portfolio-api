Rails.application.routes.draw do
  devise_for :users,
              path: 'api/v1/auth',
              path_names: {
                'sign_in': 'login',
                'sign_out': 'logout'
              },
              defaults: {
                format: :json
              }

end
