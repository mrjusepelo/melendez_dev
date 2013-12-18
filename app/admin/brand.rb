ActiveAdmin.register Brand do
config.comments = true

  menu :parent => "Datos de Producto"
form do |f|

	# if @brand.id.nil?
# if !params[:id]
# if !params[:id].nil?
	# if defined?(@brand)

			f.inputs "Marcas" do

				f.input :name
			end
			f.actions
	# else
			# f.inputs "Marcas editarlas" do

			# 	f.input :name, :input_html => {value: "asignada",:name => "date"}

			# end
			# f.actions
	# end


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
