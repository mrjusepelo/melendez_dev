ActiveAdmin.register Consigment do
  actions :all, :except => [:new, :create, :edit, :upadate, :destroy, :show]

	controller do
		
		  def create

		      Consigment.create(
		        :order_id => params[:consigment][:order_id],
		         :value => params[:consigment][:value],
		         :date => params[:consigment][:date]
		        )
		      order = Order.where(:id => params[:consigment][:order_id]).first
		      value = params[:consigment][:value]
		      sum_payments = order.sum_payments.to_i + value.to_i
		      # consigment.order.update_attribute(:sum_payments, sum_payments)
		      Order.update(params[:consigment][:order_id], :sum_payments => sum_payments)

		    redirect_to :action => :index
		    # 'admin/products#index'
		  end

		def update
		  @consigment = Consigment.find(params[:id])

		  update! do |format|

			  order = Order.where(:id => @consigment.order_id).first

				# puts "**************CONSIGNACION NUMERO*****************"+order.id.to_s
		      
		      	value = @consigment.value
				puts "**************CONSIGNACION NUMERO*** VALOR CONSIGNADO**************"+value.to_s
		      	sum_payments = order.sum_payments.to_i + value.to_i
		      	Order.update(order.id, :sum_payments => sum_payments)


		    format.html { redirect_to :action => :index }
		  end
		end



















	      before_filter :protected_attributes
	        def protected_attributes
	          params.permit!
	        end
	      
   end

end
