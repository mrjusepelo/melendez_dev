ActiveAdmin.register SupportDocument do
  menu :parent => "Creditos"
actions :all, :except => [:destroy]
  filter :credit, label: "Credito", :as => :select, :collection => Credit.find(:all, :order => "id").map(&:id)
  filter :name
  filter :route
  filter :created_at
  filter :updated_at


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
