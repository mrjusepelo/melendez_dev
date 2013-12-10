ActiveAdmin.register CreditProduct do
  menu :parent => "Creditos"

    # show do |inventory|
    show do |creditProduct|
      attributes_table do 
        row :id
        row "Credito" do
          # if defined?(creditProduct.credit.id)
           idCredit = creditProduct.credit.id
          # else
            # id = "Sin asignar"
          # end
        end


        # row :credit_id
        row :amount
        row :value
        row :created_at
        row :updated_at
        row :unit_value
        row :inventory_fields
        row "Inventario" do
        	idInventory = creditProduct.inventory.id
        link_to idInventory, admin_inventory_path(idInventory)		
        # link_to product.name, admin_product_path(product)		

        end
        # row :inventory_id

      end
    end



    controller do

          before_filter :protected_attributes
            def protected_attributes
              params.permit!
            end
    end

end
