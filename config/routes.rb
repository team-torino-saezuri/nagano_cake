Rails.application.routes.draw do
  resources :orders,only:[:new, :index, :show, :create] do
    collection do
      post 'confirm'
      get 'thanx'
    end
  end
end
