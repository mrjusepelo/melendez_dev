class OrdersController < ApplicationController
  def notification
    # Order.select(:date_limit_pay).where(date_limit_pay: '2013-11-2').first
     # @products = Order.select(:date_limit_pay, :id).where(date_limit_pay: (Date.today-5)).first
     @products = Order.select(:date_limit_pay, :id).where(date_limit_pay: ((Date.today-5)..Date.today)).length

     @ultimoPago = Notification.where(nextdate: Date.today)

    # notificaciones pasadas sin ser revizadas
     @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

    # pedidos que no tengan estado cacelado o terminado
     @vigentes = Order.where.not(:state_id => [4,6] ).count

      

@numNotificaciones = @ultimoPago.count.to_i + @pasadas.count.to_i

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
