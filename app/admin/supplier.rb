ActiveAdmin.register Supplier do
  menu :parent => "Referencias"
actions :all, :except => [:destroy]
 config.comments = true

  index do
    # column :name
    # row :nextdate
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
        row :created_at
        row :updated_at
      end
      active_admin_comments

    end


form do |f|
			f.inputs "Proveedores" do |inventory|
        attributes_table do 
          row :id
          row :product_id
          # product = Product.where(id: inventory.product_id).first
          # brand = Brand.where(id: product.brand_id).first
          row "Marca" do
            if defined?(inventory.product.brand.name)
             marca = inventory.product.brand.name
            else
              marca = "Sin asignar"
            end
          end
          row :supplier_id
          row :barcode
          row :serial
          row :vale_buy
          row :vale_sale
          row :iva
          row :warranty
          row :date_in
          row :date_out
          row :created_at
          row :updated_at
        end
      end
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
