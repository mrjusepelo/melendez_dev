ActiveAdmin.register ProductCategory do

	  form do |f|
    f.inputs "Categories" do
      # f.input :product
      f.input :product_id, :as => :select, :collection => Hash[Product.all.map{|b| [b.name, b.id]} ]
  	  # f.input :product, :as => :check_boxes, :collection => Product.order("last_name ASC").all
  	    # f.input :product_id, :as => :check_boxes, :collection => Product.all
  	  # f.input :product_id, :as => :select, :collection => Product.all

  	  # f.input :product, :as => :check_boxes, :collection => ["Justin", "Kate", "Amelia", "Gus", "Meg"]
# f.input :authors, :as => :check_boxes, :collection => User.order("last_name ASC").all
# f.input :book_id, :as => :select,      :collection => Hash[Book.all.map{|b| [b.name,b.id]}]

      
      # f.input :category
  	  
		# f.input :category_id, :as => :select,      :collection => Hash[Category.all.map{|b| [b.name,b.id]}]
  	  # f.input :category_id, :as => :check_boxes
  	  # f.input :category_id, :as => :check_boxes, :collection => Hash[Category.all.map {|e| [e.name, e.id]} ]
  	  # f.input :category_id, :as => :check_boxes, :collection => Category.order("name ASC").all
      # f.input :category_id, :as => :check_boxes, :collection => Category.order("name ASC").all
  	  f.input :category_id, :as => :check_boxes, :collection => Category.all


      f.input :code
    end
    f.actions
  end









		controller do
		    def permitted_params
          # params.permit product_category: [:product_id, :category_id => [], :code]
          params.permit product_category: [:product_id, :category_id, :code, category_ids: {}]
          # params.permit post: [:campo1, :campo2 category_ids: []]
		      # params.permit product_category: [:product_id, :category_id, :code]
	# rails g model product_category product:references category:references code:integer

		    end

     # def create 
     #      puts params[:product_category].to_s
     
     # end
	 end

	#  controller do 
	#    def create 
	#         puts params[:product_category].to_s
	   
	#    end
	# end

	 # f.input :book_id, :as => :select,      :collection => Hash[Book.all.map{|b| [b.name,b.id]}]


























end
