Project2::Application.routes.draw do
  get "pages/login"
  match "pages/login", :via => [:get,:post]
  match "pages/continue" => "pages#continue"

  get "pages/logout"
  root :to => "pages#login"

  get "submit/index"

  get "submit/new"

  get "submit/edit"

  get "suggestion_users/index"
  match "suggestion_users/new" => "suggestion_users#new"
  match "suggestion_users/create" => "suggestion_users#create"
  match "suggestion_users/chooseSuggestion" => "suggestion_users#chooseSuggestion"
  match "suggestion_users/edit" => "suggestion_users#edit"
  match "suggestion_users/update" => "suggestion_users#update"
get "users/new"
  match "users/create" => "users#create"
  get "users/edit"

  get "users/index"
 

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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
