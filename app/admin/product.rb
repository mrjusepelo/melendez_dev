ActiveAdmin.register Product do
  # actions :all, :except => [:new, :create, :edit, :upadate, :destroy, :show]

# actions :defaults => false do |product|
#       link_to "View", admin_product_path(product)
#     end



	form do |f|

      f.inputs "Categories" do

			f.input :categories, :as => :check_boxes, :collection => Category.all
			f.input :name
			f.input :description
			f.input :amount
			f.input :brand
			# f.input :image

      f.has_many :images do |im|
        im.inputs 'Imagenes' do 
          im.input :route
          im.input :priority
        end
      # f.actions
      end

		end
		    f.actions
	end

  index do 
    column :id
    column :name
    column :description
    column :amount
    column :brand
    # column :user
    column :created_at
    column :updated_at
    # default_actions
    # actions do |product|
    #   link_to "Agregar a Inventario", admin_product_path(product)
    # end
    actions do |product|
      # link_to "Agregar a Inventario", admin_inventories_path(), :class => "member_link"
      link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    end
  end
























controller do
  before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
