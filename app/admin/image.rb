ActiveAdmin.register Image do
	controller do
	    def permitted_params
	      params.permit image: [:route, :priority]
	    end
	 end

end
