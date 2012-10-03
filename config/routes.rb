Qm::Application.routes.draw do

  resources :business_process_department_assignments

  resources :business_process_process_indicator_assignments

  resources :business_process_document_assignments

  resources :business_process_note_assignments

  resources :business_processes

  resources :process_indicators

  resources :documents

  resources :notes

  resources :process_classes

  resources :user_function_assignments

  resources :user_role_in_company_assignments

  resources :department_affiliations

  resources :employments

  resources :roles_in_company

  resources :departments

  resources :functions

  resources :companies

  resources :substitutions

  devise_for :users

  namespace :admin do
    resources :users # Have the admin manage them here.
  end

  resources :roles

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
  root :to => 'admin/users#index'

  # See how all your routes lay out with "rake routes"
end
