ActiveAdmin.register OrderProduct do
  menu :parent => "Compra Proveedores"

  # filter :payment_mode
  # filter :order, :as => :select, :collection => Order.select(:id).all
  # filter :order, label: "Pedido", :as => :select, :collection => Order.find(:all, :order => "id").map(&:id)
  # filter :product, label: "Producto", :as => :select, :collection => Product.find(:all, :order => "name")
  filter :amount
  filter :unit_value
  filter :value
  # filter :clients, :label => 'Cliente', :as => :select, :collection => Client.find(:all, :order => "name")
  # filter :payments_credits, :label => 'Autor de Pago', :as => :select, :collection => PaymentsCredit.find(:all, :order => "name")
  # filter :nextpay, :label => 'D&iacute;a de Pago'
  # # filter :inventories
  # # filter :inventories, :as => :select, :collection => Hash[Inventory.all.map{|e| [e.collection.name, e.id]}] 
  #                                                               # City.all.map { |city| [city.name, city.id] }
  #   # page.input :catalog, :as => :select, :collection => Hash[Catalog.all.map{|e| [e.collection.name, e.id]}] 

  # filter :published, :label => 'Activo'
  filter :created_at
  filter :updated_at


  form do |f|
      # within @head do
           # script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('3.js'), :type => "text/javascript"
      # end
	
	  	f.inputs "Datos del Producto" do
                                                                # City.all.map { |city| [city.name, city.id] }
    # f.input :order_id
  # filter :clients, :label => 'Cliente', :as => :select, :collection => Client.find(:all, :order => "name")
  # f.input :order, :as => :select, :collection => Order.find(:all, :order => "id") 
  # f.input :order_id, :selected => order_product.order_id, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
  f.input :order, :as => :select, :collection => Order.find(:all, :order => "id").map(&:id), :selected => order_product.order_id

  # f.input :order, :as => :radio, :collection => [["Test", 'test'], ["Try", "try", {:disabled => true}]]
    f.input :product
    f.input :amount
    f.input :unit_value
    f.input :value
    # f.input :user_id, :as => :select, :collection => User.all.map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
    # f.input :order, :selected => order_product.order_id
    # puts "************************"+ params[:id].to_s
    puts "************************"+ order_product.order_id.to_s
    # f.input :order, as: :select, :collection => Hash[Order.all.map{|e| [e.collection.name, e.id]}]
	      # f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
	      # f.input :product_id, as: :hidden
  		end

  f.actions
end

  index do 
    selectable_column
    column :id
    column "Fecha Pedido" do |order_product|
    	if defined?(order_product.order.date_billed)
    		order_product.order.date_billed
    	else
    		"Sin asignar"
    	end
    end
    # column "Producto" do |order_product|
    # 	if defined?(order_product.product.name)
	   #     order_product.product.name
    #    else
    #    	"Sin asignar"
    #    end
    #  end

    
    # column "Marca" do |order_product|
    #     if defined?(order_product.product.brand.name)
    #      marca = order_product.product.brand.name
    #     else
    #       marca = "Sin asignar"
    #     end
    #  end         
    column "Proveedor" do |order_product|
    	if defined?(order_product.order.supplier.name)
    		order_product.order.supplier.name
    	else
    		"Sin asignar"
    	end	
    		
    end
    column :amount
    column :created_at
    column :updated_at
    # actions do |product|
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    # end
    default_actions
  end    



    show do |order_p|
      attributes_table do 
        row :id
        row :order_id do
          if defined?(order_p.order.id)
            link_to order_p.order.id, admin_order_path(order_p.order)
          else
            marca = "Sin asignar"
          end
        end

        row :product_id do
          if defined?(order_p.product.id)
            link_to order_p.product.id, admin_product_path(order_p.product)
          else
            marca = "Sin asignar"
          end
        end
        row :amount
        row :unit_value
        row :value

        row :created_at
        row :updated_at

      end
    end




    # t.integer  "order_id"
    # t.integer  "product_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "amount"
    # t.integer  "value"
    # t.integer  "unit_value"




controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
# end
end
