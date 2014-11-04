Pencil::Application.routes.draw do

# if Rails.env.production?
if Rails.env.development?
   get '404', :to => 'application#page_not_found'
   get '422', :to => 'application#server_error'
   get '500', :to => 'application#server_error'
end

  get "inventories/index"
  get "inventories/show"
  get "orders/index"
  get "orders/show"
  get "orders/view"
  get "orders/delete"
  get "orders/edit"
  get "payments_credits/index"
  get "payments_credits/show"
  get "payments_credits/delete"
  get "payments_credits/edit"
  get "payments_credits/create"
  get "payments_credits/factura"
  get "sales/index"
  get "sales/view"
  get "sales/edit"
  get "sales/show"
  get "sales/create"
  get "sales/delete"
  get "credits/new"
  get "credits/create"
  get "credits/update"
  get "credits/index"
  get "credits/show"
  get "credits/edit"
  get "credits/delete"
  get "credits/to_pdf"
  get "publics/index"
  get "publics/show"
  get "publics/new"
  get "publics/create"
  get "publics/destroy"
  get "publics/update"
  get "publics/service"
  get "publics/folio"
  get "publics/product"
  get "publics/contact"
  get "products/search"
  get "publics/view_product"
  get "publics/category"
  # get "admin/areports/proyear"
  
  resources :payments_credits do
    member do 
      get "factura"
    end
  end
   # 'payments_credits#factura'

  post "publics/create_message"

  root :to => 'publics#index'
  # root to: 'admin/products#index'

    # resources :users
    # root :to => 'users#index'
    # resources :admin
    # root to: "admin/dashboard#index"
    # root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


resources :inventories 
# resources :inventories do
#   collection do
#     get "batch_action"
#   end
# end

  resources :products do 
    collection do 
      get "autocomplete"      
    end
  end  

  resources :credits do 
    collection do 
      get "autocomplete"
      get "notification"
    end
  end    

  resources :clients do 
    collection do
      get "verify_client"
    end
  end

  resources :sales do 
    collection do 
      get "autocomplete"
    end
  end

  resources :orders do 
    collection do 
      get "notification"
    end
  end  

# map.resources :orders, :member = { :id => :get }  
# map.resources :products, :member = { :detailed => :get }  
# namespace :admin do
#   resources :order do
#     get 'id', :on => :member
#     post 'id', :on => :member
#   end
# end


    # resources :orders do
    #   member do 
    #     get "all"
    #   end
    #   resources :order_products 
        
    # end

    # resource :partners, :controller => :users do 
    #   member do 
    #     get "all"
    #   end
      
    #   collection do 
    #     get "autocomplete"
    #     get "new_local"
    #   end
    # end








  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named r
  #oute that can be invoked with purchase_url(id: product.id)
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
