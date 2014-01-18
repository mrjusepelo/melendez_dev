ActiveAdmin.register SaleProduct do
  menu :parent => "Ventas Efectivo"

  # menu :parent => "Ventasxxx"

# menu :label => proc{ I18n.t("Ventasxxx") }

actions :all, :except => [:destroy, :new]


  filter :sale, :label => 'Referencia de venta', :as => :select, :collection => SaleProduct.find(:all, :order => "id").map(&:sale_id)
  filter :inventory, :label => 'Referencia de inventario', :as => :select, :collection => Inventory.find(:all, :order => "id").map(&:id)
  filter :inventory_fields
  filter :value
  filter :amount

  filter :created_at
  filter :updated_at


    show do |sale_p|
      attributes_table do 
        row :id
        row :sale do
          if defined?(sale_p.sale.id)
            link_to sale_p.sale.id, admin_sale_path(sale_p.sale)
          else
            marca = "Sin asignar"
          end
        end
        row :value
        row :amount
        row :unit_value
        row :inventory_id do
          if defined?(sale_p.inventory.id)
            link_to sale_p.inventory.id, admin_inventory_path(sale_p.inventory)
          else
            marca = "Sin asignar"
          end
    	end
        row :inventory_fields

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
