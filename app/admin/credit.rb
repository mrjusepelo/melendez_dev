ActiveAdmin.register Credit do
  menu :parent => "Creditos"


  index do 
    selectable_column
    column :id

 column "Estado           " do |credit|

modoPago = credit.payment_mode_id
diaPago = credit.payday
ultimoPago = credit.payments_credits.where(credit_id: credit.id ).last
sumaPagos =  credit.payments_credits.sum(:value)
estado = credit.state_id
# estado = credit.state.name

fechaPagoInicial = credit.payday
must_pay = fechaPagoInicial
tipoPago = credit.payment_mode_id

# metodo que cuenta la cantidad de pagos ideal hasta hoy
def pagosIdeal(must_pay, tipoPago)
    case tipoPago
    when 2
      tipoPago = 7
    when 3
      tipoPago = 15
    when 4
      tipoPago = 1.months  # revizar este caso
    end

            cantIdeal=1
            while must_pay <= Date.today
              # must_pay +=7
              cantIdeal = cantIdeal + 1
              must_pay = must_pay + tipoPago
              if must_pay > Date.today then
                must_pay = (must_pay - tipoPago)
                cantIdeal = cantIdeal - 1
                break
                
              end
            end  

            # if Date.today == must_pay
            #         Credit.update(credit.id, :payday => must_pay)
            # end            
    return cantIdeal, must_pay
end                        



numPagos = pagosIdeal(must_pay, tipoPago)[0]
pagosAlDia =  numPagos * credit.value_payments


# # def comprobacionPagos(id, modoPago, diaPago, ultimoPago, sumaPagos, pagosAlDia, estado )
#  # if diaPago < Date.today
# #     if ultimoPago < Date.today

if diaPago > Date.today
# credit = Credit.find(credit.id)
credit.update_attribute(:state_id, 5)
      if sumaPagos < pagosAlDia
        if estado != 1
          # Credit.update(6, :state_id => 1)
          Credit.where(:id =>[credit.id]).update_all(:state_id => 1)

          # Credit.update(@credit.id, :sum_payments => sum_payments)

          # "estado diferente"

        else
          # estado
          # credit.state.name
        end

      # elsif sumaPagos == pagosAlDia
      #   if estado != 3
      #     Credit.update(credit.id, :state_id => 3)
      #   else
      #     # estado
      #     credit.state.name

      #   end     

      # elsif sumaPagos > pagosAlDia
      #     if estado != 8
      #       Credit.update(credit.id, :state_id => 8)
      #     else
      #       # estado
      #     credit.state.name

      #     end
                        

      end
end # diaPago > hoy

if diaPago < Date.today 
  if sumaPagos >= pagosAlDia 
     credit.update_attribute(:state_id, 3)  # paogs al dia
   elsif sumaPagos < pagosAlDia
     credit.update_attribute(:state_id, 1) # pagos pendientes
  end
end







      # " #{credit.id}   #{sumaPagos}    #{pagosAlDia}"
      # credit.state_id


# #     end #ultimoPago 
    
# #   end
  
# # end
  
                        # must_pay +
                        # "ite #{i}"
# "#{pagosIdeal(must_pay, 7)[0]} Este es el dia #{pagosIdeal(must_pay, 7)[1]}"






          credit.state.name


    end










    column "Cliente" do |credit|
			reg_client = credit.clients.where(credit_id: credit.id, :buyer => "true").first

    	if defined?(reg_client.name)
	
			reg_client.name
		else
		"Sin asignar"	
		end
    end

    column "Fiador" do |credit|
		 fiador = Client.where(credit_id: credit.id, bondsman: 'true').first
		 # fiador = credit.clients.where(credit_id: credit.id, bondsman: 'true').first
  		if defined? fiador.name
  			fiador.name
  		else
  			"Sin asignar"
  		end
    end
    column "Total", :total do |tot| 
      number_to_currency  tot.total
    end
    column :date
    column :payday
    column :value_payments, :sortable => :value_payments do |val|
      number_to_currency val.value_payments
    end

    column "Suma pagos", :sortable => :sum_payments do |payments|
      number_to_currency payments.sum_payments
    end


    # column :sum_payments => price
    column :created_at
    column :updated_at
    actions do |credit|
      link_to "Generar Contrato",  credits_show_path(id: credit), :class => "member_link"
      # link_to "Agregar a Inventario", credit_show_path(id: credit.id), :class => "member_link"
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    end
    # default_actions
  end    

















	form do |f|

      # if @order.id.nil?
      f.inputs "Creditos" do
      f.input :payment_mode
	  f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
      f.input :state
      f.input :payday, :as => :datepicker
      f.input :description,   input_html: {:size => '3'}

      f.has_many :credit_products do |order|

          # if order
              # puts "***********************************"+order.id.to_s
          #     order.input :product, :as => "string", input_html: {value: order.product.name, onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}

          # else
          #     # order.input :product, :as => "string", input_html: {value: product.name, onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}

          # end

        order.inputs "Productos "+ (params[:id]).to_s do 

          # if order.nil?


        # order.input :product, :as => "string", input_html: {:value => Product.find(params[:id]).name, onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        # order.input :product, :as => "string", input_html: {value: Product.find(order.product_id).name, onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        order.input :product, :as => "string", input_html: { onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        
        # order.input :product_id,  input_html: {:value => Product.find(params[:id]).id, id: "product_id"}
        order.input :product_id,  input_html: {id: "product_id", class: "product_id"}
        order.input :amount, :input_html => {id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {id: 'unit_value', :style => "width: 60px;"}
        order.input :value, :input_html => {onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 60px;"}
          within @head do
               script :src => javascript_path('1.js'), :type => "text/javascript"
               script :src => javascript_path('5.js'), :type => "text/javascript"
               script :src => javascript_path('6.js'), :type => "text/javascript"
               script :src => javascript_path('7.js'), :type => "text/javascript"

          end                 

        end

      end


      f.has_many :clients do |client|
            client.inputs 'Clientes' do 
            client.input :name #, :as => :datepicker  , :input_html => {:name => "date"}
            client.input :document  #, :input_html => {:name => "value", :style => "width: 60px;"}
            client.input :phone  #, :input_html => {:name => "value", :style => "width: 60px;"}
            client.input :city  #, :input_html => {:name => "value", :style => "width: 60px;"}
            client.input :neihborhood  #, :input_html => {:name => "value", :style => "width: 60px;"}
            client.input :address #, :input_html => {:name => "value", :style => "width: 60px;"}

            # client.input :buyer, :as => :radio, :input_html => {onclick: "javascript:eleccionComprador(this)"}        
            # client.input :bondsman, :as => :radio, :input_html => {onclick: "javascript:eleccionFiador(this)"}
            client.input :buyer, :input_html => {onclick: "javascript:eleccionComprador(this)"}        
            client.input :bondsman,  :input_html => {onclick: "javascript:eleccionFiador(this)"}      
            # client.input :buyer
            # client.input :bondsman
          end
      end


      f.has_many :payments_credits do |payment|
            payment.inputs 'Pagos' do 
            payment.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
            payment.input :value #, :as => :datepicker  , :input_html => {:name => "date"}
            payment.input :description,   input_html: {:size => '3'}
            
          end
      end

      f.has_many :support_documents do |document|
            document.inputs 'Pagos' do 
            document.input :name
            document.input :route #, :as => :datepicker  , :input_html => {:name => "date"}
            
          end
      end      


      f.input :total,  input_html: {onclick: "javascript:sumavalorcredito(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}
      f.input :number_payments, :input_html => {id: "number_payments", :style => "width: 60px;"}
      f.input :value_payments, :input_html => {id: "value_payments",onclick: "javascript:calcularPagos(this)", :style => "width: 60px;"}
		end
		    f.actions
	end














  controller do




    def create

      @credit = Credit.new(params[:credit])

        respond_to do |format|
            if @credit.save
              
              sum_payments =  @credit.payments_credits.sum(:value)
              Credit.update(@credit.id, :sum_payments => sum_payments)

               
               
               @credit.credit_products.each do |product|
                # los atributos de productos que tengan este pedido
               end

               # @credit.payments_credits.each do |consigment|
               # end


              format.html{redirect_to :action => :index}
                       
            else
              format.html{render "new", error: "Error"}
            end
      end

  end



  def update
    @credit = Credit.find(params[:id])

    update! do |format|

      sum_payments =  @credit.payments_credits.sum(:value)
      Credit.update(@credit.id, :sum_payments => sum_payments)

      format.html { redirect_to :action => :index }
    end    
    
  end




















        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end


end
