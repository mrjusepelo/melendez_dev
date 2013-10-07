ActiveAdmin.register PaymentsCredit do
  menu :parent => "Creditos"
	

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

end
