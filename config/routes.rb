Rails.application.routes.draw do
  resources :orders,only:[:new, :index, :show, :create] do
    collection do
      post 'confirm'
      get 'thanx'
    end
  end
end
  devise_for :customers
  
   #admin
  devise_for :admins, :controllers => {
    :sessions => 'admin/sessions',
    :registrations => 'admin/registrations',
  }
  
  namespace :admin do
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