ActiveAdmin.register Order do
  menu :parent => "Compra Proveedores"



index do 
    selectable_column
    column :id
    column :date_billed
    column :date_arrival
    column :date_limit_pay
    column :date_pay_real
    column :payday
    column :val_real
    column :number_payments
    column :value_payments
    column :sum_payments
    column :created_at
    column :updated_at
    column "Estado de Pedido" do |order|
      # ultimoPago = credit.payments_credits.where(credit_id: credit.id ).last
      # sumaPagos =  credit.payments_credits.sum(:value)
      totalCredito = order.val_real.to_i
      sumaPagos = order.sum_payments.to_i
      estado = order.state_id.to_i
      modoPago = order.payment_mode_id.to_i
      inicioPago = order.payday


# if order.id == 134
def pagosIdeal(modoPago, inicioPago)

  diaspagos = 0
  cont = 0
  inc = 0
# a=0

  case modoPago
  when 1
    inc = 1
  when 2
    inc = 7
  when 3
    inc = 14
  when 4
    # obtiene fecha exacta de un mes mas
    cantdias = (Date.today - (inicioPago)).to_i
    cantmeses = (Date.today.year * 12 + Date.today.month) - (inicioPago.year * 12 + inicioPago.month)  
    inc =    cantdias/cantmeses    
  end
       
        inicioPago.step(Date.today, inc) do | dia |
         cont = cont + 1

          if (inicioPago > Date.today)
           cont = cont - 1 
           break 
         end
       end
   diaspagos = cont
   
   return diaspagos

end

# a= pagosIdeal(modoPago, inicioPago)
# puts "****************"+a.to_s
# end # if registro especifico

# estados difentes de cancelado o terminado
if (estado != 4 && estado != 6)
  sumPagosIdeal = pagosIdeal(modoPago, inicioPago).to_i * order.value_payments.to_i
  
  if sumaPagos >= sumPagosIdeal

    if sumaPagos >= totalCredito
       order.update_attribute(:state_id, 6)  # credito terminado
    else  
       order.update_attribute(:state_id, 3)  # paogs al dia
    end
    
  elsif sumaPagos >= totalCredito
       order.update_attribute(:state_id, 6)  # credito terminado
  else
     order.update_attribute(:state_id, 1) # pagos pendientes

  end
  
end #condicion de estado terminado o cancelado


        if defined?(order.state.name)
            if order.state_id.to_i == 1
                span :class => "", :style => " border:none; background-color: rgb(165, 48, 48); color: white;height:30px; padding: 5px;" do 
                  estado = order.state.name
                end
            elsif order.state_id.to_i == 2
                 span :class => "", :style => " border:none; background-color: black; color: white;height:30px; padding: 5px;" do 
                    estado = order.state.name
                 end               
            elsif order.state_id.to_i == 3
                span :class => "", :style => " border:none; background-color: rgb(44, 145, 40); color: white;height:30px; padding: 5px;" do 
                  estado = order.state.name
                end  
            elsif order.state_id.to_i == 6
                 span :class => "", :style => " border:none; background-color: black; color: white;height:30px; padding: 5px;" do 
                    estado = order.state.name
                 end                   
            end

        else
          estado = "Sin asignar"
        end
    end

    column "Modo de Pago" do |order|
        if defined?(order.payment_mode.name)
          modoPago = order.payment_mode.name
        else
          modoPago = "Sin asignar"

        end
    end

    actions do |order|
            # link_to("Generar Contrato",  contract_admin_credit_path(credit), :class => "member_link") + "  " + 
            # link_to("Pagos",  admin_credit_payments_credits_path(credit), :class => "member_link") + "  " +
           # link_to("Cancelar", cancelar_admin_credit_path(credit), :method => :put, :confirm => "Estas Seguro(a)?")

            link_to("Notificaciones" + " "+ order.id.to_s, admin_order_notifications_path(order.id), :class => "member_link") + "  " +   
            link_to("Pagos", admin_order_consigments_path(order), :class => "member_link")

      # link_to "Notificaciones", new_admin_inventory_path(product), :class => "member_link"
    end
    # default_actions
  end    




























	form do |f|

      # if @order.id.nil?
      f.inputs "Pedidos" do
      f.input :supplier
      f.input :payment_mode

      f.input :payday, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
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