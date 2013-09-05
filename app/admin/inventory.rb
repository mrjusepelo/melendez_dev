ActiveAdmin.register Inventory do
  actions :all, :except => [:destroy]


# define routes for "autocomplete :admin_user, :email"
# collection_action :autocomplete_products, :method => :get
# collection_action :autocomplete_admin_user_email, :method => :get
# collection_action :autocomplete_product_name, :method => :get
# collection_action :autocomplete_product_name, :method => :get
# resources :products do
#   get :autocomplete_name, :on => :collection
# end



  form do |f|
      within @head do
           # script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('autocomplete-rails.js'), :type => "text/javascript"
           # javascript_include_tag "autocomplete-rails.js"
            # link :href => stylesheet_path('http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'), :media => "screen", :rel => "stylesheet", :type => "text/css"
           script :src => javascript_path('http://code.jquery.com/jquery-1.9.1.js'), :type => "text/javascript"
           script :src => javascript_path('http://code.jquery.com/ui/1.10.3/jquery-ui.js'), :type => "text/javascript"
           script :src => javascript_path('admin_autocomplete.js'), :type => "text/javascript"

      end
  f.inputs "Datos del Producto" do

      f.input :product, :as => "string", :input_html => {:id => "product_admin"}
      # f.input :product, :as => :autocomplete, :url => autocomplete_products_path
      # f.input :email, :as => :autocomplete, :url => autocomplete_admin_user_email_admin_admin_users_path
      # f.input :product, :as => :autocomplete, :url => autocomplete_product_name_admin_products_path
      # f.autocomplete_field :product_name, autocomplete_name_products_path
      # f.autocomplete_field :brand_name, autocomplete_brand_name_products_path
      f.input :supplier
      f.input :barcode
      f.input :vale_buy
      f.input :vale_buy
      f.input :vale_sale
      f.input :warranty
      f.input :date_in,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      # f.input :date_in,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => DateTime.now.to_i}
      f.input :date_out,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => "click aqui"}
      # f.input :comming_soon
      # image_tag("/icons/icon.gif", :height => '32', :width => '32') # =>

  end
  f.actions
end    



# rails g model inventory product:references supplier:references barcode:integer vale_buy:integer 
# vale_sale:integer warranty:integer date_in:date date_out:date





























controller do
      before_filter :protected_attributes
      	def protected_attributes
        	params.permit!
      	end
  	  end
  # autocomplete :product, :name

end
