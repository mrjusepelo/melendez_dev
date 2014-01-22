ActiveAdmin.register Order do
  menu :parent => "Compra Proveedores"
actions :all, :except => [:destroy]



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
    column :nextpay
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
            elsif order.state_id.to_i == 4
                span :class => "", :style => " border:none; background-color: rgb(165, 165, 164); color: black;height:30px; padding: 5px;" do 
                order.state.name
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

    column "" do |order|
       if order.published == false
          link_to("Ver", admin_order_path(order)) + "  " + "Nada por hacer..."
      else
            link_to("Ver", admin_order_path(order), :class => "member_link") + "  " + 
            link_to("Editar", edit_admin_order_path(order), :class => "member_link") + "  " + 
            link_to("Notificaciones" + " "+ order.id.to_s, admin_order_notifications_path(order.id), :class => "member_link") + "  " +   
            link_to("Pagos", admin_order_consigments_path(order), :class => "member_link") + "  " + 
            link_to("Cancelar", cancelar_admin_order_path(order), :method => :put, :confirm => "Estas Seguro(a)?") # + " " +
            # link_to("Generar CodBarra", codebar_admin_order_path(order), :method => :get)
            # link_to("Generar CodBarra", new_admin_inventory_path(), :method => :get, :class => "member_link")


      # link_to "Notificaciones", new_admin_inventory_path(product), :class => "member_link"
      end
    end
    # default_actions
  end    









member_action :cancelar, :method => :put do
      
  @order = Order.find(id = params[:id])
    # @order.update_attribute(:state_id, 4)
    @order.update(:state_id => 4, :published => false)
    redirect_to :action => :index, :notice => "Servicio #{@order.id}"

end



















	form do |f|

      # if @order.id.nil?
      f.inputs "Pedidos" do
        f.input :date_arrival, as: :hidden, input_html: {name: "credit_json", id: "credit_json", value: order.products.to_json}
      f.input :supplier
      f.input :payment_mode

      f.input :payday, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
			f.input :date_billed, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
			f.input :date_arrival, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
			f.input :date_limit_pay, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
			f.input :date_pay_real, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}


      f.has_many :order_products do |order|
          
        order.inputs 'Productos' do 
        order.input :product, :as => "string",  input_html: {onBlur: "javascript:salida(this)", onclick: "javascript:busquedaProducto(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        order.input :product_id, as: :hidden,   input_html: {id: "product_id", class: "order_product_id"}
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
            order.input :date, :as => :datepicker # , :input_html => {:name => "date"}
            order.input :value , :input_html => {:value => 0, :style => "width: 360px;"}
          end
      end

    f.input :val_real, :input_html => {onclick: "javascript:sumavalorpedido(this)", id: "total", :style => " width: 70px;"}
    f.input :number_payments, :input_html => {onChange:"", id: "number_payments", :style => "width: 60px;"}
    f.input :value_payments, :input_html => {onChange:"", id: "value_payments", onclick: "javascript:calcularPagos(this)", :style => "width: 60px;"}

		end
		    f.actions
	end






 show do |order|
  
      attributes_table do
        row :id
        row :date_billed
        row :date_arrival
        row :date_limit_pay
        row :date_pay_real
        row :val_real
        row :supplier
        row :sum_payments
        row :payment_mode
        row :state
        row :number_payments
        row :value_payments
        row :payday
        row :published
        row :created_at
        row :updated_at
        row :nextpay
        # row :image do
        #   image_tag(ad.image.url)
        # end

        row  "Productos " do
          table do 
            
            tr do 
              td :style => "width: 200px; background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                  "Nombre"
                end      
              end
              td id: "Marca", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Marca"
                end
              end
              td id: "cantidad", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Cantidad"
                end
              end           
              td id: "valor_unidad", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Valor Unidad"
                end
              end
              td id: "valor", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Valor"
                end
              end


            end


           order.order_products.each do |prod|
              tr do 
                td :style => "text-align: center;" do 
                  prod.product.name
                end
                td :style => "text-align: center;" do 
                  prod.product.brand.name
                end
                td :style => "text-align: center;" do 
                  prod.amount
                end
                td :style => "text-align: center;" do 
                  prod.unit_value
                end 
                td :style => "text-align: center;" do 
                  prod.value
                end                                                

              end
           end



          end
        end
      end

      # desactivado desde el inicializer/config/ActiveAdmin
      # active_admin_comments

  # table_for credit.products do
  #   column "Nombre" { |credit| credit.product.name }
  #   # column "Payment Type" { |payment| payment.payment_type.titleize }
  #   # column "Received On", :created_at
  #   # column "Payment Details & Notes", :payment_details
  #   # column "Amount" { |payment| payment.amount_in_dollars }
  # end



# attributes_table do

#     table_for Product.order("created_at desc").limit(5) do |t| 
#       t.column :name do |product|
#         link_to product.name, admin_product_path(product)
#       end 
#       t.column :created_at 
#     end

# end



      active_admin_comments

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

            # actualizo la ultima Notificacion para el sgte dia de pago del pedido actulizado
            if @order.payment_mode_id.to_i == 1
              @order.update_attribute(:nextpay, (Date.today + 1))  # proximo dia de pago
              ultNotificacion = @order.notifications.last
              Notification.update(ultNotificacion.id, revised: 'false', :nextdate => (@order.nextpay), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 2
              @order.update_attribute(:nextpay, (Date.today + 7))  # proximo dia de pago
              ultNotificacion = @order.notifications.last
              Notification.update(ultNotificacion.id, revised: 'false', :nextdate => (@order.nextpay), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 3
              @order.update_attribute(:nextpay, (Date.today + 14))  # proximo dia de pago
              ultNotificacion = @order.notifications.last
              Notification.update(ultNotificacion.id, revised: 'false', :nextdate => (@order.nextpay), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              @order.update_attribute(:nextpay, (mes1))  # proximo dia de pago
              mesnotify = mes1 - 3.day

              ultNotificacion = @order.notifications.last
              Notification.update(ultNotificacion.id, revised: 'false', :nextdate => mes1, :order_id => @order.id)

            end






















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