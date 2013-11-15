ActiveAdmin.register OrderProduct do
  menu :parent => "Compra Proveedores"



#   form do |f|
#       within @head do
#            script :src => javascript_path('1.js'), :type => "text/javascript"
#            script :src => javascript_path('3.js'), :type => "text/javascript"
#       end
	
# 	  	f.inputs "Datos del Producto" do

# 	      f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
# 	      f.input :product_id, as: :hidden
#   		end

#   f.actions
# end

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











controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
# end
end
