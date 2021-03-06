WithHonours::Application.routes.draw do
  

  resources :searches
  resources :basic_searches, only: [:create]

  devise_for :companies
  devise_for :users

  devise_scope :user do
    resources :users
  end

  devise_scope :company do
    resources :companies
  end

  resources :messages, only: [:create, :destroy]

  get 'conversation/:id',   to: "messages#conversation",  as: "conversation"
  get 'inbox',              to: 'messages#inbox'
  get '/HR',                to: 'questions#index'
  get '/Comms',             to: 'questions#index'
  get '/Consulting',        to: 'questions#index'
  get '/General',           to: 'questions#index'
  get '/Marketing',         to: 'questions#index'

  authenticated :user do
    root :to => "questions#index"
  end
  
  authenticated :company do
    root :to => "questions#index"
  end

  root :to => "pages#home"

  resources :questions do 
    member do
      put :vote
    end
    resources :answers do
      member do
        put :vote
      end
      resources :comments do
        member do
          put :vote
        end
      end
    end
  end
  
  # resources :messages, only: [:new, :create]
end


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

