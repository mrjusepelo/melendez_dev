ActiveAdmin.register Image do
  menu :parent => "Datos de Producto"
# actions :all, :except => [:destroy]
  

  # filter :product, :label => 'Nombre de Producto', :as => :select, :collection => Product.find(:all, :order => "name")
  filter :route
  filter :priority
  filter :created_at
  filter :updated_at  

form do |f|

      f.inputs "Imagenes" do

			f.input :product, :as => :select, :collection => Product.all
			f.input :route
			f.input :priority
          	f.input :remote_route_url
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
