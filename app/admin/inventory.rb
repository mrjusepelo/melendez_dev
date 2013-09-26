ActiveAdmin.register Inventory do
  menu :parent => "Inventario"


 # filter :barcode, :as => :string 

  # filter :barcode, :as => :string, :collection => lambda{ Inventory.barcodes }
  # filter :author, :as => :select, :collection => lambda{ Product.authors }
   
  # actions :all, :except => [:destroy]


  form do |f|
      within @head do
           script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('2.js'), :type => "text/javascript"
           script :src => javascript_path('3.js'), :type => "text/javascript"

      end
  f.inputs "Datos del Producto" do


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



  index do 
    column :id

    column :barcode
    #column "Codigo de barras", :barcode
     # column "My Custom Title", :barcode
    column "Nombre" do |inventory|
       inventory.product.name
     end
    column "Marca" do |inventory|
       marca = inventory.product.brand.name
     end         
    column :vale_buy
    column :vale_sale
    column :warranty
    column :date_in
    column :date_out
    # column :user
    column :created_at
    column :updated_at
    # actions do |product|
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    # end
    default_actions
  end    



controller do

  def create
    timestamp = (DateTime.now.to_i).to_s
    # Convert number of seconds into Time object.
    # Time.at(time)

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
