Rails.application.routes.draw do

  get 'welcome/index'

  # get 'owners/index'
  #
  # get 'owners/show'
  #
  # get 'owners/new'
  #
  # get 'owners/edit'
  #
  # get 'owners/create'
  #
  # get 'owners/update'
  #
  # get 'owners/destroy'

  devise_for :users

  # resources :owners do
  #   resources :dogs
  # end
  #
  # resources :owners

  resources :owners

  get 'details' => 'owners#show'
  post 'details' => 'owners#create'
  patch 'details' => 'owners#update'
  put 'details' => 'owners#update'
  delete 'details' => 'owners#destroy'
  get 'details/new' => 'owners#new', as: :new_details
  get 'details/edit' => 'owners#edit', as: :edit_details

  resources :dogs

  get 'dogs/:id/register' => 'dogs#start_registration', as: :register_dog
  patch 'dogs/:id/register' => 'dogs#register'
  post 'dogs/:id/register' => 'dogs#register'

  get 'admin/registrations' => 'admin#list_registrations'

  # get 'owner/:id/dog/:id' => register#create
  # get 'register/new/owner/:owner_id/dog/:dog_id'

  # get 'register/owner/:owner_id/dog/:dog_id' => 'registration#new', as: :dogreg
  # post 'register/owner/:owner_id/dog/:dog_id' => 'registration#create'

  # get 'register/dog/:dog_id/owner/:owner_id' => 'registration#new', as: :register_dog
  # post 'register/dog/:dog_id/owner/:owner_id' => 'registration#create'
  # post 'register' => 'registration#create', as: :registration_create
  # get 'register/confirm' => 'registration#confirm', as: :registration_confirm

  # get 'register/dog/:dog_id' => 'registration#new', as: :register_dog
  # get 'register/dog/:dog_id' => 'registration#create'

  # resources :owners do
  #   resources :dogs
  # end

  root 'welcome#index'

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
