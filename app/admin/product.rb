ActiveAdmin.register Product do

	controller do
	    def permitted_params
	      params.permit product: [:name, :description]
	    end
	 end
end
