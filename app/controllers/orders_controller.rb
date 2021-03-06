class OrdersController < ApplicationController
  def notification
    # Order.select(:date_limit_pay).where(date_limit_pay: '2013-11-2').first
     # @products = Order.select(:date_limit_pay, :id).where(date_limit_pay: (Date.today-5)).first
     @products = Order.select(:date_limit_pay, :id).where(date_limit_pay: ((Date.today-5)..Date.today)).length
    # pedidos que no tengan estado cacelado o terminado
     @vigentes = Order.where.not(:state_id => [4,6] ).count


     # Notification.where("nextdate = ? AND revised = 'false'", (Date.today + 3)).limit(5)
     

    # pagos Proximos dentro de 3 dias y hoy 
                      # Notification.where(nextdate: (Date.today..(Date.today + 3)), revised: false)
     pagos_proximos = Notification.where(nextdate: (Date.today..(Date.today + 3)), revised: false).length
     # pagos_proximos = Notification.where(nextdate: ((Date.today - 3)..Date.today), revised: false).length

     # pedidos con pagos pendientes
     @pagosPendientes = Order.select(:id).where(state_id: 1).length #pagos pendientes
     
     # pedidos con pagos para HOY 
     @ultimoPago = Notification.where(nextdate: Date.today)

    # notificaciones pasadas sin ser revizadas
     @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

    



      

@numNotificaciones = @ultimoPago.count.to_i + @pagosPendientes.to_i + pagos_proximos.to_i

# los que son notificados hoy
# los que son notificados antes de hoy y no estan vistos







    respond_to do |format|
      format.json { render :json => @numNotificaciones}     
    end


  end

  def index
  end

  def show
  end

  def view
  end

  def delete
  end

  def edit
  end
end
