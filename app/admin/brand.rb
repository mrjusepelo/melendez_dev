ActiveAdmin.register Brand do
  menu :parent => "Datos de Producto"
config.comments = true
actions :all, :except => [:destroy]

  # filter :products, :label => 'Nombre de Producto', :as => :select, :collection => Product.find(:all, :order => "name")
  filter :name
  filter :created_at
  filter :updated_at  

		form do |f|
			f.inputs "Marcas", :class => "noshow" do
				f.input :name
			end
		f.actions

		end   

controller do
    
	def create
		@brand = Brand.new(params[:brand])

		respond_to do |format|
			if @brand.save

				format.html{redirect_to :action => :index}
			else
				format.html{render "new", error: "Error"}
			end
		end
			
	end

def update
	@brand = Brand.find(params[:id])
		num = @brand.id	
	update! do |format|
      format.html { redirect_to :action => :index }
    end
end

	def edit
     	@brand = Brand.find(params[:id])
		@num = @brand.id
		# # respond_to do |format|
  #   		if @brand.update_attributes(params[:brand])
  #   			# format.json { head :ok }
  #   			puts "**********DESDE ADMIN***************"
  #   		end
  #   	# end









		# after_update do
	 #            Brand.update(2, :name => "editado2")

		# end
		# respond_to do |format|

	   #   	if @brand.update
	   #          Brand.update(@brand.id, :name => "editado2")
		  #    	# respond_with @brand
				# # Brand.update(2, :name => "campoeditado2")
	   #   	end
		# end

  	end



      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end

end
