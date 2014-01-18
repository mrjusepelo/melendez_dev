ActiveAdmin.register Supplier do
  menu :parent => "Referencias"
actions :all, :except => [:destroy]


form do |f|
			f.inputs "Proveedores" do
				f.input :name
				f.input :phone
				f.input :email
				f.input :city
				f.input :frecuence_notification
				f.input :state

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
