Pencil::Application.routes.draw do

  # get "errors/file_not_found"
  # get "errors/unprocessable"
  # get "errors/internal_server_error"

# if Rails.env.production?
# if Rails.env.development?
   get '404', :to => 'application#page_not_found'
   get '422', :to => 'application#server_error'
   get '500', :to => 'application#server_error'
# end




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


# match '/404', to: 'errors#file_not_found', via: :all
# match '/422', to: 'errors#unprocessable', via: :all
# match '/500', to: 'errors#internal_server_error', via: :all


end
