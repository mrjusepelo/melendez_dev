class PaymentsCreditsController < ApplicationController
  def index
  end

  def show
  end

  def delete
  end

  def edit
  end

  def create
  end

  def factura
    @imagenes = Image.select(:id, :route).where(priority: 'true')
    @categories = Category.all



@bill =  PaymentsCredit.find(id = params[:id])
@bill =  PaymentsCredit.find(14)
@credit = Credit.find(@bill.credit_id)
@mes = @bill.date.strftime("%B")
@credits = PaymentsCredit.select(:id, :date, :value, :interes).where(credit_id: @bill.credit_id).order("id ASC")
@payment_value = PaymentsCredit.select(:id, :date, :value, :interes).where(credit_id: @bill.credit_id).last

@nameUser = current_admin_user.name
# vista creada en views/admin/credits/contract
     html = render_to_string(:action => "factura.html.erb", :layout => false)
      kit = PDFKit.new(html)
    send_data(kit.to_pdf, :filename => 'facturaPago.pdf', :type => 'application/pdf', :disposition => 'inline')






  end
end
