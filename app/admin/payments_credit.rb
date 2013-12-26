ActiveAdmin.register PaymentsCredit do
  # menu :parent => "Creditos"
  # menu false
  belongs_to :credit

  index do 
    selectable_column
    column :id
    column :date
    column :value
    column "Credito" do |payment|
      if defined?(payment.credit.id)
        payment.credit.id
      else
        "Sin asignar"
      end
    end
    column :created_at
    column :updated_at
    actions do |p|
      # link_to "Agregar a Inventario", contract_admin_credit_path(p), :class => "member_link"
      # link_to "Agregar a Inventario", admin_credit_payments_credit_factura_path(p), :class => "member_link"
      link_to "Factura", payments_credits_factura_path(id: p), :class => "member_link"
                         # admin/payments_credits/factura
                                      # /admin/credits/:credit_id/payments_credits/:id/factura
                                      # facturaPagos_admin_credit_payments_credit  
      # link_to "Generar Contrato",  bill_admin_credit_payments_credit_path(p), :class => "member_link"
                                   # facturaPagos_admin_credit_payments_credit   
    end
        # default_actions
        # puts "********************"+paymentsCredit.to_s
  end 


# member_action :factura, :method => :get do
# @bill =  PaymentsCredit.find(id = params[:id])

# end
# member_action :bill, :method => :get do
# # @bill =  PaymentsCredit.find(id = params[:id])
# @bill =  PaymentsCredit.find(14)
# @credit = Credit.find(@bill.credit_id)
# @mes = @bill.date.strftime("%B")
# @credits = PaymentsCredit.select(:id, :date, :value, :interes).where(credit_id: @bill.credit_id).order("id ASC")
# @payment_value = PaymentsCredit.select(:id, :date, :value, :interes).where(credit_id: @bill.credit_id).last

# @nameUser = current_admin_user.name
# # vista creada en views/admin/credits/contract
#      html = render_to_string(:action => "facturaPagos.html.erb", :layout => false)
#       kit = PDFKit.new(html)
#     send_data(kit.to_pdf, :filename => 'facturaPago.pdf', :type => 'application/pdf', :disposition => 'inline')
# end

















  show do |payment|
      attributes_table do
      row :date
      row :value
      row :credit do 
			payment.credit_id
      	end
      row :description
      row :created_at
      row :updated_at

      # h3 payment.credit_id
    end
  end




form do |f|

      f.inputs "Pagos de Credito" do

      f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      f.input :value
      f.input :description, :input_html => { :placeholder => "Describe la forma en la que hiciste este PAGO"}
      # f.input :description, :attr, :placeholder => "placeholder text"
      f.input :document 
      f.input :name 
      # f.input :new_comment

      
      #active_admin_comments 
      # f.input :interes 
       end
      f.actions
end    




















  controller do

# metodo q corre siempre para definir variable
before_filter :nested_credit
def nested_credit 
    @credit = Credit.find(params[:credit_id])  
end


      def create

          # @credit = Credit.find(params[:credit_id])
            @payments_credit = @credit.payments_credits.new(params[:payments_credit])
          respond_to do |format|
              if @payments_credit.save
                  sum_payments_credit = @credit.payments_credits.sum(:value)
                  @credit.update_attribute(:sum_payments, sum_payments_credit)

                format.html{redirect_to :action => :index}
                         
              else
                format.html{render "new", error: "Error"}
              end
          end




      end


  def update
    @payments_credit = @credit.payments_credits.find(params[:id])

    update! do |format|

      sum_payments_credit = @credit.payments_credits.sum(:value)
      @credit.update_attribute(:sum_payments, sum_payments_credit)

      format.html { redirect_to :action => :show }
    end
  end    





        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end

end
