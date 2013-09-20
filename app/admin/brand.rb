ActiveAdmin.register Brand do
  menu :parent => "Datos de Producto"
  

controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end

end
