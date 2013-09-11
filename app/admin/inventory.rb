ActiveAdmin.register Inventory do
  # actions :all, :except => [:destroy]
  # actions :all, :except => [:destroy]



  form do |f|
      within @head do
           script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('2.js'), :type => "text/javascript"
           script :src => javascript_path('3.js'), :type => "text/javascript"
            # link :href => stylesheet_path('jquery-ui-1.10.3.custom.css'), :media => "screen", :rel => "stylesheet", :type => "text/css"
           # script :src => javascript_path('autocomplete-rails.js'), :type => "text/javascript"
           # javascript_include_tag "autocomplete-rails.js"
            # link :href => stylesheet_path('http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'), :media => "screen", :rel => "stylesheet", :type => "text/css"
           # script :src => javascript_path('jquery-1.9.1.js'), :type => "text/javascript"
           # script :src => javascript_path('jquery-ui-1.10.3.custom.js'), :type => "text/javascript"
           # script :src => javascript_path('admin_autocomplete.js'), :type => "text/javascript"

      end
  f.inputs "Datos del Producto" do

      # @post = Product.find(params[:id])
      # @post = Product.find(1)
      # @page_title = "#{@post.name}: Comments" # Set the page title

      # puts "NOMBRE DE PRODUCTO**********************"+@page_title

  # f.input :product, input_html: {id: "product", name: "product_aux"}
  # f.input :product_id, as: :hidden


      # f.input :product, :as => "string", input_html: {id: "product", name: "product_aux"}
      f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
      # f.input :product_id, as: :hidden





      # f.input :product
      f.input :supplier
      f.input :barcode,  :as => "string", :input_html => {id: "", :style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      f.input :vale_buy
      f.input :vale_buy
      f.input :vale_sale
      f.input :warranty
      f.input :date_in,  :as => "string", :input_html => {id: "datepi", :style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
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
end
