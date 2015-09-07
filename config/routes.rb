Rails.application.routes.draw do

  get 'homes/about_us' => 'homes#about_us'
  get 'homes/employee_guides' => 'homes#employee_guides'
  get 'homes/complaint' => 'homes#complaint'
  post 'homes/complaint' => 'homes#complaint'
  get 'homes/child_labor' => 'homes#child_labor'
  get 'homes/child_welfare_committee' => 'homes#child_welfare_committee'
  get 'homes/be_valunteer' => 'homes#be_valunteer'
  get 'homes/donate' => 'homes#donate'
  get 'homes/contact_us' => 'homes#contact_us'
  get 'homes/child_labor_definations' => 'homes#child_labor_definations'
  get 'homes/generalprinciple' => 'homes#generalprinciple'
  get 'homes/pocwc' => 'homes#pocwc'
  get 'homes/limitation' => 'homes#limitation'
  get 'homes/focwc' => 'homes#focwc'
  get 'homes/responsibilityocwc' => 'homes#responsibilityocwc'
  get 'homes/childfriendly' => 'homes#childfriendly'
  get 'homes/occupation' => 'homes#occupation'
  get 'homes/process_list' => 'homes#process_list'
  get 'homes/healthandsafty' => 'homes#healthandsafty'
  get 'homes/penalties' => 'homes#penalties'
  get 'homes/legalprovisions' => 'homes#legalprovisions'
  get 'homes/document' => 'homes#document'
  resources :complaints

  resources :reports do
    collection do
      get :child_labour_years
      get :child_labour_year_wise_report
      get :child_begger_years
      get :child_begger_year_wise_report
      get :all_over_child_labours
      get :all_over_child_beggers
      get :download_pdf
      get :panchnama_child_labour
      get :panchnama_child_begger
      get :get_child_labour

      get :get_child_begger
    end
    member do
      get :panchnama
      get :child_labours
      get :child_beggers
    end
  end

  resources :dashboard do
    collection do
      get :attachments
    end
  end

  resources :answers

  resources :user_complaint
  resources :questions

  resources :child_labours

  resources :child_beggers

  resources :raids do
    resources :community_farms do
      collection do
        get :community_farm
        post :create_community_farm
      end
    end
    resources :child_labours
    resources :children
    resources :child_beggers
  end

  resources :employers

  resources :departments

  resources :locations

  resources :roles

  resources :communities

  devise_for :users

  resources :users

  # root 'dashboard#index'
  root 'homes#index'

end
