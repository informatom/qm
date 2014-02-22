Qm::Application.routes.draw do

  resources :document_process_step_assignments

  resources :instruction_document_assignments

  resources :note_process_step_assignments

  resources :instruction_process_step_assignments


  resources :sequence_flows
  resources :flow_objects
  resources :process_steps
  resources :instructions

  resources :news do
    collection do
      get 'latest'
      get 'display'
    end
  end

  resources :business_process_department_assignments
  resources :business_process_process_indicator_assignments
  resources :business_process_document_assignments
  resources :business_process_note_assignments

  resources :business_processes do
    member do
      get 'diagram'
      post 'diagram'
      get 'reset'
      get 'step_diagram'
    end
  end

  resources :process_indicators do
    collection do
      get :autocomplete_user_lastname
    end
  end

  resources :documents do
    member do
      get 'download'
    end
  end

  resources :notes
  resources :process_classes
  resources :user_function_assignments
  resources :user_role_in_company_assignments
  resources :department_affiliations
  resources :employments
  resources :roles_in_company
  resources :departments
  resources :functions
  resources :companies do
    member do
      get 'organigram'
      post 'organigram'
      post 'copy'
    end
  end

  resources :substitutions
  devise_for :users

  namespace :admin do
    resources :users # Have the admin manage them here.
  end

  match "/submissions" => "submissions#create"

  resources :roles

  root :to => 'news#latest'
end
