ActiveAdmin.register Supplier do
  menu :parent => "Referencias"
actions :all, :except => [:destroy]


form do |f|
			f.inputs "Proveedores" do
				f.input :name
				f.input :phone
				f.input :email
				f.input :city
			
				#quitaado por q no se esta validando
				# f.input :frecuence_notification
				#quitaado por q no se esta validando
				# f.input :state 

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
