Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: :json do
    get "form", to: "poker#index"
    post "judge", to: "poker#judge"
  end

end
