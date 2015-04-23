Rails.application.routes.draw do


  #exec position controller
  get 'execPosView' => 'exec_pos#show'
  get 'addExec' => 'exec_pos#new'

  #eboard controller
  get 'addEboard' => 'eboards#new'


  #session controller
  get 'sessions/new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  #club controller
  get 'clubView' =>'clubs#show'
  get 'clubEdit' =>'clubs#edit'
  get 'clubAdd' =>'clubs#new'
  get 'people' => 'clubs#people'
  get 'isFavorite' => 'clubs#isFavorite'
  get 'favorite' => 'clubs#favorite'
  get 'unfavorite' => 'clubs#unfavorite'


  #user controller
  get 'signup' =>'users#new'
  get 'yourClubs' => 'users#yourclubs'


  #home controller
  get 'requests' => 'home#requests'
  get  'about' =>'home#about'
  root 'home#home'
  get 'viewSelected' => 'home#view'#this represents the users Yourclubs.html.erb and not home-view







 


  resources :users
  resources :clubs
  resources :exec_pos
  resources :eboards


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
