ActiveAdmin.register Product do

	form do |f|
	    f.inputs "Categories" do

			f.input :categories, :as => :check_boxes, :collection => Category.all
			f.input :name
			f.input :description


		end
		    f.actions
	end

	controller do
	    def permitted_params
	      # params.permit category: [:category_id, :name, :tags]
	      params.permit product: [:name, :description,  :category_ids => []]
	    end
	 end
end
