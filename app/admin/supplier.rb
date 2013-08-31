ActiveAdmin.register Supplier do


	controller do
		    def permitted_params
		      params.permit supplier: [:name, :email, :phone]

		    end
	 end

end
