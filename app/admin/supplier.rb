ActiveAdmin.register Supplier do
  menu :parent => "Referencias"


form do |f|
			f.inputs "Proveedores" do
				f.input :name
				f.input :phone
				f.input :email
				f.input :city
				f.input :frecuence_notification

			end
			f.actions
end			

controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
end
