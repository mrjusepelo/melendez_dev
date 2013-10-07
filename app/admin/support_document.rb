ActiveAdmin.register SupportDocument do

  show do |document|
      attributes_table do
      row :id
      row :name
      row :route
      row :credit do 
			document.credit_id
      	end
      row :created_at
      row :updated_at
      # h3 payment.credit_id
    end
    active_admin_comments 
  end




end
