Rails.application.routes.draw do
  devise_for :customers
  
   #admin
  devise_for :admins, :controllers => {
    :sessions => 'admin/sessions',
    :registrations => 'admin/registrations',
  }
  
  namespace :admin do
    resources :items,only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update] do
      member do
        get :current_index
        resource :order_details, only:[:update]
      end
      collection do
        get :today_order_index
      end
    end
  end
  
end