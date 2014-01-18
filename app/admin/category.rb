ActiveAdmin.register Category do
  menu :parent => "Datos de Producto"
actions :all, :except => [:destroy]
  

  filter :name, label: "Nombre de Categoria"
  filter :products, :label => 'Nombre de Producto', :as => :select, :collection => Product.find(:all, :order => "name")
  # filter :created_at
  # filter :updated_at  


controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
