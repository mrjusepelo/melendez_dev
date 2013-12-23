class CreditsController < ApplicationController

  respond_to :html, :json

  def autocomplete 
# a = Inventory.select(:id, :product_id).find(:all)
# (a).each do |pro|
#  puts pro.product.name
# end



    # @products = Product.autocomplete params[:term]
    @products = Inventory.where("lower(barcode) like ? AND state_inventory_id = 1", "%#{(params[:term]).downcase}%" ) 
    # @products = Inventory.where("lower(barcode) like ?", "%#{(params[:term]).downcase}%" ) AND :state_inventory_id = 1
    # WHERE (LOWER(persons.name) ILIKE 'jo%') AND active_person = 1
    # @products = Inventory.where(:state_inventory_id = 1 AND "lower(barcode) like ?", "%#{(params[:term]).downcase}%" )
    
    

    # @products = Product.where("lower(name) like ?", "%#{(params[:term]).downcase}%")

# @products = Product.where('id IN (SELECT product_id FROM inventories WHERE lower(name) like ?)', '%#{(params[:term]).downcase}%')
 # @products = Product.where('id IN (SELECT product_id FROM inventories ) AND lower(name) like ?', '%#{(params[:term]).downcase}%' )


# a = Inventory.select(:id, :product_id).find(:all)
# (a).each do |pro|
#     @products = pro.product.name
# end

    
    respond_with @products
  end






  def notification

    #  @products = Credit.where(date_limit_pay: ((Date.today-5)..Date.today)).length
     
    #  @pagosPendientes = Order.select(:id).where(state_id: 1).length #pagos pendientes

    #  @ultimoPago = Notification.where(nextdate: Date.today)

    # # notificaciones pasadas sin ser revizadas
    #  @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

    # # pedidos que no tengan estado cacelado o terminado
    #  @vigentes = Order.where.not(:state_id => [4,6] ).count

      


# los que son notificados hoy
# los que son notificados antes de hoy y no estan vistos

@credit = Credit.find(:all)

@contador = 0
@credit.each do |credit|

  totalCredito = credit.total.to_i
      sumaPagos = credit.sum_payments.to_i
      estado = credit.state_id.to_i
      modoPago = credit.payment_mode_id.to_i
      inicioPago = credit.payday


# if order.id == 134
def pagosIdeal(modoPago, inicioPago)

  diaspagos = 0
  cont = 0
  inc = 0
  proximoPago = Date
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
          proximoPago = dia
          if (inicioPago > Date.today)
            proximoPago = proximoPago - inc
           cont = cont - 1 
           break 
         end
       end
   diaspagos = cont
   
   return diaspagos, proximoPago

end

# a= pagosIdeal(modoPago, inicioPago)
# puts "****************"+a.to_s
# end # if registro especifico

# estados difentes de cancelado o terminado
if (estado != 4 && estado != 6)
diaPago = Date
 diaPago = pagosIdeal(modoPago, inicioPago)[1]
 if diaPago == Date.today
   @contador += 1
 end

end



end # fin each credit

puts "*******************"+@contador.to_s
@numNotificacionesCreditos =  @contador.to_i



    respond_to do |format|
      format.json { render :json => @numNotificacionesCreditos}     
    end


end




end
