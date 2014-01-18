ActiveAdmin.register PaymentsCredit do
  # menu :parent => "Creditos"
  # menu false
  belongs_to :credit

  index do 
    selectable_column
    column :id
    column :date
    column :value
    column :name
    column :document
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
      link_to "Factura", pago_admin_credit_payments_credit_path(p.credit.id, id: p.id), :class => "member_link"
    end
        # default_actions
  end 


# end

member_action :pago, :method => :get do

@pago =  PaymentsCredit.find(id = params[:id])

# vista creada en views/admin/payments_credits
     # html = render_to_string(:action => "payments_credits/pago.html.erb", :layout => false)
     html = render_to_string(:action => "pago.html.erb", :layout => false)
      kit = PDFKit.new(html)
      kit.stylesheets << 'vendor/assets/stylesheets/style_bill.css'
      kit.stylesheets << 'vendor/assets/stylesheets/style_bill2.css'
    send_data(kit.to_pdf, :filename => 'PagoCredito.pdf', :type => 'application/pdf', :disposition => 'inline')
end








  show do |payment|
      attributes_table do
      row :id
      row :date
      row :value
      row :name
      row :document
      row :credit do 
			payment.credit_id
      	end
      # row :interes
      row :description
      row :created_at
      row :updated_at

      # h3 payment.credit_id
    end
      active_admin_comments
    
  end




form do |f|

      f.inputs "Pagos de Credito" do

      f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      f.input :value
      f.input :description, :input_html => { :placeholder => "Describe la forma en la que recibiste este PAGO"}
      # f.input :description, :attr, :placeholder => "placeholder text"
      f.input :document 
      f.input :name 

      if payments_credit.id

      else 
      # f.input :interes, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
      end
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

                    #No se esta mostrando el campo debido a que el calculo solo esta para el valor del credito en general 
                  # calculoInteres = @credit.interesmora.to_i + @credit.interescorriente.to_i
                  # @payments_credit.update_attribute(:interes, calculoInteres)



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
