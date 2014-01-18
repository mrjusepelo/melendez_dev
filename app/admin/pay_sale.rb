ActiveAdmin.register PaySale do
  menu :parent => "Ventas Efectivo"
actions :all, :except => [:destroy]


controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
