ActiveAdmin.register Category do
	controller do
	    def permitted_params
	      params.permit category: [:category_id, :name, :tags]
	    end
	 end

end
