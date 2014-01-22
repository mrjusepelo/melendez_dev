ActiveAdmin.register CreditProduct do
  menu :parent => "Creditos"
actions :all, :except => [:destroy]






  # filter :inventory, label: "Producto de Inventario", :as => :select, :collection => Inventory.find(:all, :order => "id").map(&:id)
  # filter :credit, label: "Credito", :as => :select, :collection => Credit.find(:all, :order => "id").map(&:id)
  filter :inventory_fields, as: :string
  filter :amount
  filter :unit_value
  filter :value
  filter :created_at
  filter :updated_at
  # filter :product, label: "Producto", :as => :select, :collection => Product.find(:all, :order => "name")


  form do |f|
  
      f.inputs "Producto de Credito" do
        f.input :inventory, :as => :select, :collection => Inventory.find(:all, :order => "id").map(&:id), :selected => credit_product.inventory_id
        f.input :credit, :as => :select, :collection => Credit.find(:all, :order => "id").map(&:id), :selected => credit_product.credit_id
        f.input :amount
        f.input :unit_value
        f.input :value
        f.input :inventory_fields
      end

  f.actions
end



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
