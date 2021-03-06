Rails.application.routes.draw do
  resources :galeries
  #get 'home/index'
  root "galeries#index"
  devise_for :users
  

  
  resources :galeries do
    member do
      delete :delete_image_attachment
    end
  end

end
