Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  get 'users/edit'

  get 'orders/index'

  get 'orders/new'

  get 'orders/edit'

  get 'orders/show'

  get 'searches/index'

  get 'searches/ask'

  get 'searches/result'

  get 'courses/index'

  get 'courses/edit'

  get 'courses/new'

  get 'courses/show'

  get 'menus/index'

  get 'menus/edit'

  get 'menus/new'

  get 'menus/show'

  get 'menu/index'

  get 'menu/new'

  get 'menu/edit'

  get 'menu/shot'

  get 'chefs/new'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :chefs do
    resources :menus do
      resources :courses
    end
  end

  resources :searches

  resources :orders

  resources :users

  resources :account_activations, only: [:edit]

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #Locale
  # config/routes.rb
  scope "(:locale)", locale: /en|es/ do
    resources :chefs
    resources :orders
    resources :searches
  end
end
