ActiveAdmin.register Supplier do
  menu :parent => "Referencias"
actions :all, :except => [:destroy]
 config.comments = true

  index do
    column :id
    column :name 
    column :phone 
    column :email
    column :created_at
    column :updated_at 
    default_actions
  end


    show do |supplier|
      attributes_table do 
        row :id
        row :name
        row :phone
        row :email
        row :city
        row :created_at
        row :updated_at
      end
      active_admin_comments

    end





form do |f|
			f.inputs "Proveedores" do |inventory|

      # end
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
