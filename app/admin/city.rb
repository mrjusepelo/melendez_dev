ActiveAdmin.register City do
  menu :parent => "Referencias"

controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
