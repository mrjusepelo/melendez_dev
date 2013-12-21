ActiveAdmin.register Order do
  menu :parent => "Compra Proveedores"

	form do |f|

      # if @order.id.nil?
      f.inputs "Pedidos" do
      f.input :supplier
      f.input :payment_mode

			f.input :date_billed, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
			f.input :date_arrival, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
			f.input :date_limit_pay, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today+30} 
			f.input :date_pay_real, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}


      f.has_many :order_products do |order|
          
        order.inputs 'Productos' do 
        order.input :product, :as => "string",  input_html: {onBlur: "javascript:salida(this)", onclick: "javascript:busquedaProducto(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        order.input :product_id,   input_html: {id: "product_id"}
        order.input :amount, :input_html => {onChange:"", id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {onBlur:"", id: "unit_value", :style => "width: 60px;"}
        order.input :value, :input_html => {onBlur:"", onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 60px;" }
        





          within @head do
               script :src => javascript_path('admin_order.js'), :type => "text/javascript"
               # script :src => javascript_path('1.js'), :type => "text/javascript"
               # script :src => javascript_path('5.js'), :type => "text/javascript"

          end                 

        end

      end

      f.has_many :consigments do |order|
            order.inputs 'Consignaciones' do 
            order.input :date #, :as => :datepicker  , :input_html => {:name => "date"}
            order.input :value  #, :input_html => {:name => "value", :style => "width: 60px;"}
          end
      end

    f.input :val_real, :input_html => {onclick: "javascript:sumavalorpedido(this)", id: "total", :style => " width: 70px;"}
    f.input :number_payments, :input_html => {onChange:"", id: "number_payments", :style => "width: 60px;"}
    f.input :value_payments, :input_html => {onChange:"", id: "value_payments", onclick: "javascript:calcularPagos(this)", :style => "width: 60px;"}

		end
		    f.actions
	end





controller do

  def create

    @order = Order.new(params[:order])

      respond_to do |format|
          if @order.save

            # crea las Notificationes con 3 dias de anticipacion para cada una
            if @order.payment_mode_id.to_i == 1
              Notification.create(revised: 'false', :nextdate => (Date.today + 1), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 2
              Notification.create(revised: 'false', :nextdate => (Date.today + 4), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 3
              Notification.create(revised: 'false', :nextdate => (Date.today + 11), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              mesnotify = mes1 - 3.day
              Notification.create(revised: 'false', :nextdate => mesnotify, :order_id => @order.id)  

            end
            
            sum_payments =  @order.consigments.sum(:value)
            Order.update(@order.id, :sum_payments => sum_payments)

             
             pagos = @order.id
             
             @order.order_products.each do |product|
              # los atributos de productos que tengan este pedido
              puts "*****************************"+product.id.to_s
              puts "*****************************"+product.amount.to_s
             end

             @order.consigments.each do |consigment|
             end


            format.html{redirect_to :action => :index}
                     
          else
            format.html{render "new", error: "Error"}
          end
    end

end


def update
  @order = Order.find(params[:id])

  update! do |format|

    sum_payments =  @order.consigments.sum(:value)
    Order.update(@order.id, :sum_payments => sum_payments)

    format.html { redirect_to :action => :index }
  end
end

















      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
end