<<<<<<< HEAD
Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/createx'

  get 'messages/new'

  get 'messages/create'

  get 'messages/show'

  get 'messages/delete_multiple'

  root 'browse#home'
  get 'browse/profile'
  get 'browse/message'
  get 'browse/aboutus'
  get  "refresh"  => "browse#refreshscribbles", :as => "refresh"
  get "votedup"  => "browse#votedup", :as => "votedup"
  get  "voteddown"  => "browse#voteddown", :as => "voteddown"
  #Session Users
  get 'logout_user' => "sessions#destroy", :as => "logout_user"
  post 'login_user' => "sessions#new", :as => "login_user"

  #Users
  get 'signup' => 'users#new', :as => 'signup'
  
  resources :users
  resources :sessions
  resources :scribbles

 

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
=======
Killedbydoozy::Application.routes.draw do
  
  resources :users
  resources :user_sessions
  #Sessions & Users & Profile
  get "logout" => "user_sessions#destroy", :as => "logout"
  get "login" => "user_sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
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

<<<<<<< HEAD
  # Example resource route with sub-resources:
=======
  # Sample resource route with sub-resources:
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

<<<<<<< HEAD
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
=======
  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
<<<<<<< HEAD
=======

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
end
