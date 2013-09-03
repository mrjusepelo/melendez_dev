ActiveAdmin.register Inventory do

<<<<<<< HEAD
# form do |f|
#     f.inputs "Categories" do
#       # f.input :product_category_id
#       # f.input :product_category_id, :as => :select, :collection => ProductCategory.all
#       # f.input :product_category_id, :as => :select, :collection => Hash[ProductCategory.all.map{|b| [b.Product.name+"-"+b.Category.name,b.id]}]
#       		f.input :product_category, :as => "select", :include_blank => "Seleccione", :collection => Hash[ProductCategory.all.map{|s| [s.Product.name+"-"+s.Category.name,s.id]}]
#       		# f.input :schedule, :as => "select", :include_blank => "Seleccione", :collection => Hash[Schedule.all.map{|s| [s.Day.name+"-"+s.Hour.name,s.id]}]

#       # f.input :product_category_id, :as => :select, :collection => Hash[ProductCategory.all.map{|b| [b.name, b.id]} ]
# 	  	# product.input :size, :include_blank => "Selecciona", :as => :select, :collection => Size.all, :input_html => {:class => "required select-size", :name => "reference[products_attributes][1][size_id]" }
#     end
#     f.actions
#   end
# # f.input :product_category_id, :as => :select, :collection => Hash[Product.all.map{|b| [b.name, b.id]} ]


# controller do
# 	    def permitted_params
# 	      params.permit inventory: [:product_category_id, :image_id, :supplier_id, :barcode_id, :vale_buy, :vale_sale, :warranty, :date_in, :date_out]
# 	      params.permit product: [:name, :description]
# 	      # params.permit category: [:category_id, :name, :tags]

# 	    end
#  end
=======
form do |f|
    f.inputs "Categories" do
      # f.input :product_category_id
      # f.input :product_category_id, :as => :select, :collection => ProductCategory.all
      # f.input :product_category_id, :as => :select, :collection => Hash[ProductCategory.all.map{|b| [b.Product.name+"-"+b.Category.name,b.id]}]
      		f.input :product_category, :as => "select", :include_blank => "Seleccione", :collection => Hash[ProductCategory.all.map{|s| [s.Product.name+"-"+s.Category.name,s.id]}]
      		# f.input :schedule, :as => "select", :include_blank => "Seleccione", :collection => Hash[Schedule.all.map{|s| [s.Day.name+"-"+s.Hour.name,s.id]}]

      # f.input :product_category_id, :as => :select, :collection => Hash[ProductCategory.all.map{|b| [b.name, b.id]} ]
	  	# product.input :size, :include_blank => "Selecciona", :as => :select, :collection => Size.all, :input_html => {:class => "required select-size", :name => "reference[products_attributes][1][size_id]" }
    end
    f.actions
  end
# f.input :product_category_id, :as => :select, :collection => Hash[Product.all.map{|b| [b.name, b.id]} ]


controller do
	    def permitted_params
	      params.permit inventory: [:product_category_id, :image_id, :supplier_id, :barcode_id, :vale_buy, :vale_sale, :warranty, :date_in, :date_out]
	      params.permit product: [:name, :description]
	      # params.permit category: [:category_id, :name, :tags]

	    end
 end
>>>>>>> b9243ff58e78d4856e36e4192d28beaab34e3018
end
