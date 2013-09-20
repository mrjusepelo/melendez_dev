ActiveAdmin.register Inventory do
  menu :parent => "Inventario"
  
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
      f.input :product_id, as: :hidden
# $i = 0
# $num = 4
# while $i < $num  do
#    # puts("*********************Inside the loop i = #$i" )


    
     # f.input :barcode,  :as => "string", :input_html => { :value => "#$i", id: "", :style => "background-color: #E6E6E6; width: 60px;"}
    # Inventory.create(:barcode => barcode.value)
#     $i +=1
# end

      # f.input :product
      f.input :barcode, :label => "Cantidad", :input_html => { id: "amount", name: "amount", :style => "background-color: #E6E6E6; width: 60px;"} 
      f.input :supplier
      # f.input :barcode,  :as => "string", :input_html => {id: "", :style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
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



controller do

  def create
    timestamp = (DateTime.now.to_i).to_s

    (1..params[:amount].to_i).each do |i|
      Inventory.create(
        :product_id => params[:inventory][:product_id], :barcode => timestamp+""+i.to_s,
         :supplier => params[:inventory][:supplier],
         :vale_buy => params[:inventory][:vale_buy],:vale_sale => params[:inventory][:vale_sale],
         :warranty => params[:inventory][:warranty],:date_in => params[:inventory][:date_in],
         :date_out => params[:inventory][:date_out]
        )
    end
    redirect_to :action => :index
    # 'admin/products#index'
  end
      before_filter :protected_attributes
      	def protected_attributes
        	params.permit!
      	end
  	  end
end
