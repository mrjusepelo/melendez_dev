ActiveAdmin.register Image do
  menu :parent => "Datos de Producto"


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
