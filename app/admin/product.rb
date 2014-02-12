ActiveAdmin.register Product do
actions :all, :except => [:destroy]

 # menu :label => "Lista de Productos"
  menu :parent => "Inventario"
  
  filter :name
  # filter :barcode, :as => :string, :collection => lambda{ Inventory.barcodes }
  # filter :author, :as => :select, :collection => lambda{ Product.authors }
  # actions :all, :except => [:new, :create, :edit, :upadate, :destroy, :show]

# actions :defaults => false do |product|
#       link_to "View", admin_product_path(product)
#     end



  # form :html => { :enctype => "multipart/form-data" } do |f|
	form do |f|

      f.inputs "Categories" do

			f.input :categories, :as => :check_boxes, :collection => Category.all
			f.input :name
			f.input :description
			# f.input :amount, :input_html => {:style => "width: 60px;"}
			f.input :brand

      f.has_many :images do |im|
        im.inputs 'Imagenes' do 
          im.input :route
          im.input :remote_route_url
          im.input :priority
        end
      # f.actions
      end

		end
		    f.actions
	end

  index do 
    selectable_column
    column :id
    column :name
    column :description
    column :brand
    # column :user
    column :created_at
    column :updated_at
    # actions do |product|
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    # end
    default_actions
  end




    show do |product|
      attributes_table do 
        row :id
        row :name
        row :description
        row :brand
        row :created_at
        row :updated_at
      end
      active_admin_comments

    end








controller do
  before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
