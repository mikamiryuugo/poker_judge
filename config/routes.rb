Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: :json do
    post "judge", to: "poker#judge"
  end

end
