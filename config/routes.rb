Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  # cari_items
  resources :cart_items, only:[:index, :update, :create, :destroy] do
    collection do
      delete '/' => 'cart_items#all_destroy'
    end
  end

end
