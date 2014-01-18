ActiveAdmin.register StateInventory do
menu false
actions :all, :except => [:destroy]

  filter :inventories, :label => 'Inventarios', :as => :select, :collection => Inventory.find(:all, :order => "id").map(&:id)
  filter :name
  filter :created_at
  filter :updated_at

controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
