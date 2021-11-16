Rails.application.routes.draw do
  devise_for :customers
  root to: "customers/homes#top"

  #customer
  namespace :customer do
    resources :cart_items, only:[:index, :update, :create, :destroy] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
  end

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

