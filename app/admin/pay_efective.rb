ActiveAdmin.register PayEfective do


  index do 
    selectable_column
    column :id
    column :name
    column :date
    column :value
    column :created_at
    column :updated_at

    default_actions
  end    

















controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
