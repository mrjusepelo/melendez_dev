ActiveAdmin.register PaymentsCredit do
  menu :parent => "Creditos"
	

  index do 
    selectable_column
    column :id
    column :date
    column :value
    column "Pedido" do |payment|
      if defined?(payment.credit.id)
        payment.credit.id
      else
        "Sin asignar"
      end
    end
    column :created_at
    column :updated_at
        default_actions
  end 





  show do |payment|
      attributes_table do
      row :date
      row :value
      row :credit do 
			payment.credit_id
      	end
      row :description
      row :created_at
      row :updated_at
      # h3 payment.credit_id
    end
  end




  controller do
        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end

end
