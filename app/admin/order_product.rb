ActiveAdmin.register OrderProduct do



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










controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
# end
end
