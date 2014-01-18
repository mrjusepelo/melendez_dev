ActiveAdmin.register PayEfective do
  menu :parent => "Ventas Efectivo"
actions :all, :except => [:destroy]

  # filter :sale#, :label => 'Referencia de venta', :as => :select, :collection => Sale.find(:all, :order => "id")
  filter :num_register
  filter :name
  filter :value
  filter :num_account
  filter :date
  # filter :created_at
  filter :updated_at

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




    show do |pay|
      attributes_table do 
        row :id
        row :date
        row :name
        row :value
        row :sale do
          if defined?(pay.sale.id)
            link_to pay.sale.id, admin_sale_path(pay.sale)
          else
            marca = "Sin asignar"
          end
        end
        row :created_at
        row :updated_at


      end
    end




controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
