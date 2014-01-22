ActiveAdmin.register Credit do
# config.comments = true
  menu :parent => "Creditos"

  filter :payment_mode
  # filter :state, as: :select, :collection => State.find(:all, :order => "name")
  # filter :clients, :label => 'Cliente', :as => :select, :collection => Client.find(:all, :order => "name")
  # filter :payments_credits, :label => 'Autor de Pago', :as => :select, :collection => PaymentsCredit.find(:all, :order => "name")
  filter :subtotal
  filter :nextpay, :label => 'D&iacute;a de Pago'
  # filter :inventories
  # filter :inventories, :as => :select, :collection => Hash[Inventory.all.map{|e| [e.collection.name, e.id]}] 
                                                                # City.all.map { |city| [city.name, city.id] }
    # page.input :catalog, :as => :select, :collection => Hash[Catalog.all.map{|e| [e.collection.name, e.id]}] 

  filter :total
  filter :published, :label => 'Activo'
  filter :created_at
  filter :updated_at

  
  # filtres
  # http://www.activeadmin.info/docs/3-index-pages.html
  
  # actions :all, :except => [:new, :create, :edit, :upadate, :destroy]
# actions :all, :except => [:destroy]
# actions :index, :show, :new, :create, :update, :edit
  # actions :all, :except => [:destroy, :edit, :update]


   # disallowed = []
   # disallowed << :destroy unless proc{ can? :destroy, Credit }
   # actions :all, :except => disallowed

  # if condition
    
  # end



    # member_action :comments do
    #   @post = Post.find(params[:id])

    #   # This will render app/views/admin/posts/comments.html.erb
    # end


  index do 
    selectable_column
      # @credit = Credit.new(params[:credit])

    column :id
    column :admin_user
    column 'Admin Creador' do |admin|      
      creador = AdminUser.select(:name).where(:id => admin.admin_creator_id).first

      if defined? creador.name
         creador.name
      else
        creador = "No definido"
      end
    end

    column "Estado " do |credit|

       totalCredito = credit.total.to_i
      sumaPagos = credit.sum_payments.to_i
      estado = credit.state_id.to_i
      modoPago = credit.payment_mode_id.to_i
      inicioPago = credit.payday


# if credit.id == 134
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
        when 5
          inc = 7000
        end
             
             if inc == 7000 
               diaspagos = 1

              else
                    inicioPago.step(Date.today, inc) do | dia |
                     cont = cont + 1

                      if (inicioPago > Date.today)
                       cont = cont - 1 
                       break 
                     end
                   end
               diaspagos = cont
             end
         
         return diaspagos

      end

# a= pagosIdeal(modoPago, inicioPago)
# puts "****************"+a.to_s
# end # if registro especifico

# estados difentes de cancelado o terminado con campo published false
# if (estado != 4 && estado != 6)
if (credit.published == true)

  sumPagosIdeal = pagosIdeal(modoPago, inicioPago).to_i * credit.value_payments.to_i
  
  if sumaPagos >= sumPagosIdeal

      if sumaPagos >= totalCredito
         credit.update_attribute(:state_id, 6)  # credito terminado
      else  
         credit.update_attribute(:state_id, 3)  # paogs al dia
      end
    
  elsif sumaPagos >= totalCredito
       credit.update_attribute(:state_id, 6)  # credito terminado
  else
     credit.update_attribute(:state_id, 1) # pagos pendientes

  end
  
end #condicion de estado terminado o cancelado




              if credit.state_id.to_i == 1
                  span :class => "", :style => " border:none; background-color: rgb(165, 48, 48); color: white;height:30px; padding: 5px;" do 
                   
                  credit.state.name
                  end
              elsif credit.state_id.to_i == 2 || credit.state_id.to_i == 5
                   span :class => "", :style => " border:none; background-color: black; color: white;height:30px; padding: 5px;" do 
                      credit.state.name
                  end               
              elsif credit.state_id.to_i == 3
                  span :class => "", :style => " border:none; background-color: rgb(44, 145, 40); color: white;height:30px; padding: 5px;" do 
                  credit.state.name
                  end
              elsif credit.state_id.to_i == 6
                  span :class => "", :style => " border:none; background-color: rgb(238, 238, 48); color: black;height:30px; padding: 5px;" do 
                  credit.state.name
                  end
              elsif credit.state_id.to_i == 4
                  span :class => "", :style => " border:none; background-color: rgb(165, 165, 164); color: black;height:30px; padding: 5px;" do 
                  credit.state.name
                  end    

              else                                          
                  credit.state.name
              end



  end # fin columna de estado



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


    column "subtotal", :subtotal do |credit|
      number_to_currency  credit.subtotal
    end #fin columna subtotal
   



    column "Total", :total do |credit| 



              # # # si el credito tiene interes corriente 
              # if credit.interescorriente > 0  
              #   calculoInteresCorriente = (credit.interescorriente / 365.0)/100
              #   totalCredito = (credit.total + (credit.total * calculoInteresCorriente.to_f)).to_f
              #     puts "**************id reg con interes corriente"+credit.id.to_s
              #     puts "**************total interescorriette"+totalCredito.to_s
              #    credit.update_attribute(:total, totalCredito)  # actualizo el campo total si exite el interes corriente
              #    # Credit.update(credit.id, :total => totalCredito) 
                
              # end








       totalCredito = credit.total.to_i
      sumaPagos = credit.sum_payments.to_i
      estado = credit.state_id.to_i
      modoPago = credit.payment_mode_id.to_i
      inicioPago = credit.payday


        # if credit.id == 2
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
          when 5
            inc = 7000
          end
               
               if inc == 7000 
                 diaspagos = 1

                else
                      inicioPago.step(Date.today, inc) do | dia |
                       cont = cont + 1

                        if (inicioPago > Date.today)
                         cont = cont - 1 
                         break 
                       end
                     end
                 diaspagos = cont
               end
           
           return diaspagos

        end # fin metodo pagosIdeal

        
        if (credit.published == true)

          sumPagosIdeal = pagosIdeal(modoPago, inicioPago).to_i * credit.value_payments.to_i
          if sumaPagos >= sumPagosIdeal
                 @totalIntereses = credit.total
            # interescorriente = credit.interescorriente.to_i

          else
                llevaCuota = (sumaPagos / credit.value_payments).to_i

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
                    when 5
                      inc = 7000
                  end # fin case

                  fechaLlevaCuota = inicioPago + (llevaCuota * inc)
                  diasSinPago = (Date.today - fechaLlevaCuota).to_i
                  interesmora = credit.interesmora

            
            # if ((credit.interesmora != nil) && (credit.interesmora != 0 ) && (credit.interesmora != ""))
            # if defined?(interesmora)
                calculoInteresMora = (interesmora/365.0)/100

# # si el credito tiene interes corriente 
if credit.interescorriente > 0  
  calculoInteresCorriente = (credit.interescorriente / 365.0)/100
  # totalCredito = (credit.total + (credit.total * calculoInteresCorriente.to_f)).to_f
  subtotalCredito = (credit.subtotal + (credit.subtotal * calculoInteresCorriente.to_f)).to_f
else
  subtotalCredito = credit.subtotal

end

                # totalInteresCorriente = credit.total 
                 @totalIntereses =  subtotalCredito + ( calculoInteresMora * subtotalCredito * diasSinPago.to_i).to_f
                 # @totalIntereses =  credit.subtotal + ( calculoInteresMora * credit.subtotal * diasSinPago.to_i).to_f

             # si total no tiene actualizado el valor del interes 
                 if credit.total < @totalIntereses

                    credit.update_attribute(:total, @totalIntereses)

                  end
                
                  puts "****************"+calculoInteresMora.to_s
                  puts "****************"+@totalIntereses.to_s

                # @totalIntereses = credit.subtotal + interesmora.to_f

            # else
                # @totalIntereses = credit.total 
              
            # end


          end # fin suma de pagos > sumaPagosIdeal
        

        else # si credito no tiene estado publicado
            @totalIntereses = credit.total

        end # fin credito publicado

        puts "****************"+llevaCuota.to_s
        puts "****************"+fechaLlevaCuota.to_s
        puts "****************"+diasSinPago.to_s

        # end # if registro especifico

    # @totalIntereses = credit.subtotal

      number_to_currency  @totalIntereses
      # number_to_currency  credit.total

    end # fin column total
    column :date
    column :payday
    column :value_payments, :sortable => :value_payments do |val|
      number_to_currency val.value_payments
    end

    column "Suma pagos", :sortable => :sum_payments do |payments|
      # number_to_currency payments.sum_payments
      number_to_currency payments.sum_payments
    end

    # column :nextpay

    column "Proximo Pago" do |credit|

      totalCredito = credit.total.to_i
      sumaPagos = credit.sum_payments.to_i
      estado = credit.state_id.to_i
      modoPago = credit.payment_mode_id.to_i
      inicioPago = credit.payday


# if credit.id == 2
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
  when 5
    inc = 7000
  end
       
       if inc == 7000 
         diaspagos = 1
         proximoPago = inicioPago

        else        
       
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
       end   
   return diaspagos, proximoPago

end

# a= pagosIdeal(modoPago, inicioPago)
# puts "****************"+a.to_s
# end # if registro especifico

# estados difentes de cancelado o terminado
if (credit.published == true)
    diaPago = Date # declaro el tipo de dato para diaPago
     diaPago = pagosIdeal(modoPago, inicioPago)[1]

     if diaPago != credit.nextpay
           credit.update_attribute(:nextpay, diaPago)  # proximo dia de pago
     end

     if diaPago == Date.today
       diaPago = "Hoy"
     else
      diaPago
      # Date.parse(diaPago)
     end

    end

end #fin columna proximo
















    column "Modo de Pago" do |credit|
        if defined?(credit.payment_mode.name)
          modoPago = credit.payment_mode.name
        else
          modoPago = "Sin asignar"

        end
    end

    column :interescorriente
    column :interesmora
    # column "Interes Mora" do |credit|

    # end # fin columna interes de mora



































    # column :sum_payments => price
    column :created_at
    column :updated_at

   
    column "" do |credit|

       if credit.state_id.to_i == 4
          link_to("Ver", admin_credit_path(credit)) + "  " + "Nada por hacer..."
       else   
            link_to("Ver",  admin_credit_path(credit), :class => "member_link") + "  " + 
            link_to("Editar",  edit_admin_credit_path(credit), :class => "member_link") + "  " + 
            link_to("Generar Contrato",  contract_admin_credit_path(credit), :class => "member_link") + "  " + 
            link_to("Pagos",  admin_credit_payments_credits_path(credit), :class => "member_link") + "  " +
            link_to("Notificaciones",  admin_credit_notification_credits_path(credit), :class => "member_link") + "  " +
           link_to("Cancelar", cancelar_admin_credit_path(credit), :method => :put, :confirm => "Estas Seguro(a)?")
          # default_actions

      end
    end
 end









# member_action :cancelar, :method => :get do
member_action :cancelar, :method => :put do
      
  @credit = Credit.find(id = params[:id])
      # credit.lock!

      @credit.update_attribute(:published, false)
      @credit.update_attribute(:state_id, 4)

        @credit.credit_products.each do |pro_inventory|
          pro_inventory.inventory.update_attribute(:state_inventory_id, 1) 
           # Inventory.update(pro_inventory.inventory.id, :state_inventory_id => 1)
        end



    redirect_to :action => :index, :notice => "Servicio #{@credit.id}"

  #   update! do |format|

  #       format.html { redirect_to :action => :index }
  #   end    

end

member_action :contract, :method => :get do
@credit = Credit.find(id = params[:id])
@nameUser = current_admin_user.name
# vista creada en views/admin/credits/contract
     html = render_to_string(:action => "contract.html.erb", :layout => false)
      kit = PDFKit.new(html)
      kit.stylesheets << 'vendor/assets/stylesheets/style.css'
    send_data(kit.to_pdf, :filename => 'contratoCredito.pdf', :type => 'application/pdf', :disposition => 'inline')
end


# %meta{:name => 'pdfkit-footer_right', :content => "[page]"}











	form do |f|

      f.inputs "Creditos" do
        # f.input :date, as: :hidden, input_html: {name: "credit_json", id: "credit_json", value: credit.products.to_json}
        # f.input :date, as: :hidden, input_html: {name: "credit_json", id: "credit_json", value: credit.products.to_json}
      # f.input :admin_user
    

      if credit.id
           f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
      else  
        f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
        f.input :admin_creator_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
         
     end
      f.input :payment_mode
	    f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
      # f.input :state
      f.input :payday, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
      f.input :description,   input_html: {:size => '3'}

      f.has_many :credit_products do |order|

        order.inputs "Productos " do 

        order.input :inventory_fields, input_html: {onKeypress:"return noEnviar(event)", onBlur: "javascript:salida(this)", onclick: "javascript:busquedaProducto(this)", id: "product", :style => "background-color: #E6E6E6; width: 650px;"}
        order.input :inventory_id, as: :hidden,  input_html: {id: "product_id", class: "creadit_product_id"}
        order.input :amount, :input_html => {onChange:"", id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {onBlur:"", id: "unit_value", :style => "width: 260px;"}
        order.input :value, :input_html => {onBlur:"", onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 260px;" }
          within @head do
               script :src => javascript_path('admin_credit.js'), :type => "text/javascript"
               script :src => javascript_path('6.js'), :type => "text/javascript"

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
            payment.input :value , :input_html => {onChange:""}
            payment.input :name
            payment.input :document
            payment.input :description,   input_html: {:size => '3'}
            
          end
      end

      f.has_many :support_documents do |document|
            document.inputs 'Pagos' do 
            document.input :name
            document.input :route #, :as => :datepicker  , :input_html => {:name => "date"}
            
          end
      end      


      # f.input :subtotal,  input_html: {onChange:"", onclick: "javascript:sumavalorcredito(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}
      f.input :total,  input_html: {onChange:"", onclick: "javascript:sumavalorcredito(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}
      f.input :number_payments, :input_html => {onChange:"", id: "number_payments", :style => "width: 60px;"}
      f.input :value_payments, :input_html => {onChange:"", id: "value_payments",onclick: "javascript:calcularPagos(this)", :style => "width: 60px;"}
     
      # muestro el valor por defecto segun si se va a editar o no 
      if credit.id
          f.input :interescorriente, :input_html => {onChange:"", id: "interescorriente", :style => "width: 60px;"}
          f.input :interesmora, :input_html => {onChange:"", id: "interescorriente", :style => "width: 60px;"}
          
      else  
          f.input :interescorriente, :input_html => {onChange:"", id: "interescorriente", :style => "width: 60px;", :value => 0}
         f.input :interesmora, :input_html => {onChange:"", id: "interescorriente", :style => "width: 60px;", :value => 0}

     end



		end
		    f.actions
	end






    show do |credit|

    within @head do
         script :src => javascript_path('7.js'), :type => "text/javascript"

    end        
      attributes_table do
        row :id
        row :admin_user
        row :admin_creator_id
        row :payment_mode
        row :state
        row :description
        row :created_at
        row :updated_at
        row :date
        row :sum_payments
        row :payday
        row :number_payments
        row :value_payments
        row :subtotal
        row :total
        row :interescorriente
        row :interesmora
        # row :image do
        #   image_tag(ad.image.url)
        # end

        row  "Productos " do
          table do 
            
            tr do 
              td :style => "width: 200px; background-color: rgb(221, 221, 221); " do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                  "Nombre"
                end      
              end
              td id: "Marca", :style => "background-color: rgb(221, 221, 221); " do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Marca"
                end
              end
              td id: "Serial", :style => "background-color: rgb(221, 221, 221); " do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                  "No. Serial"
                end
              end              

            end


           # credit.products.each do |p|
           credit.inventories.each do |inv|
              tr do 
                td do 
                  inv.product.name
                  # "La nombre del productos mas largo q piudiera umatginar"
                end
                td do 
                  inv.product.brand.name
                  # 'nombreMarca'
                end
                td do
                  inv.serial
                  # "Numero serial del producto"
                end
              end
           end



          end
        end
      # active_admin_comments

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

    def show
           
    end


    def create
# Credit.caramelo(su,)
      @credit = Credit.new(params[:credit])

        respond_to do |format|
            if @credit.save

              @credit.update_attribute(:published, true)   #pongo estado publicado el credito 
              @credit.update_attribute(:subtotal, @credit.total)   #actualizo el valor con los intereses del credito 

            # crea las Notificationes para el sgte dia de pago y actualizo el sgt dia de pago en credito
            if @credit.payment_mode_id.to_i == 1
              @credit.update_attribute(:nextpay, (Date.today + 1))  # proximo dia de pago
              NotificationCredit.create(revised: 'false', :nextdate => (@credit.nextpay), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 2
              @credit.update_attribute(:nextpay, (Date.today + 7))  # proximo dia de pago
              NotificationCredit.create(revised: 'false', :nextdate => (Date.today + 7), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 3
              @credit.update_attribute(:nextpay, (Date.today + 14))  # proximo dia de pago
              NotificationCredit.create(revised: 'false', :nextdate => (Date.today + 14), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              @credit.update_attribute(:nextpay, (mes1))  # proximo dia de pago
              mesnotify = mes1 - 3.day
              NotificationCredit.create(revised: 'false', :nextdate => mes1, :credit_id => @credit.id)  

            end



              # estados para el credito creado
              if @credit.payday == Date.today
                Credit.update(@credit.id, :state_id => 2) # pagara hoy
                # credit.update_attribute(:state_id, 3)  # paogs al dia
              end
              if @credit.payday > Date.today
                Credit.update(@credit.id, :state_id => 5) # aprobado
                # credit.update_attribute(:state_id, 3)  # paogs al dia
              end              


              # si el credito tiene interes corriente 
              if @credit.interescorriente > 0  
                calculoInteresCorriente = (@credit.interescorriente / 365.0)/100
                totalCredito = @credit.total + (@credit.total * calculoInteresCorriente.to_f)

                  @credit.update_attribute(:total, totalCredito)  # actualizo el campo total si exite el interes corriente
                
              end

              sum_payments =  @credit.payments_credits.sum(:value)
              Credit.update(@credit.id, :sum_payments => sum_payments)

               
               
               @credit.credit_products.each do |crePro|
                  crePro.inventory.update_attribute(:state_inventory_id, 3)

                  # credit = Credit.find(2)
                  # credit.update_attribute(:state_id, 3)

                  # Inventory.where(:id =>[27]).update_all(:state_inventory_id => 3)
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

              @credit.update_attribute(:subtotal, @credit.total)   #actualizo el valor con los intereses del credito 



            # actualizo la ultima Notificacion para el sgte dia de pago del credito actulizado
            if @credit.payment_mode_id.to_i == 1
              @credit.update_attribute(:nextpay, (Date.today + 1))  # proximo dia de pago
              ultNotificacion = @credit.notification_credits.last
              NotificationCredit.update(ultNotificacion.id, revised: 'false', :nextdate => (@credit.nextpay), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 2
              @credit.update_attribute(:nextpay, (Date.today + 7))  # proximo dia de pago
              ultNotificacion = @credit.notification_credits.last
              NotificationCredit.update(ultNotificacion.id, revised: 'false', :nextdate => (@credit.nextpay), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 3
              @credit.update_attribute(:nextpay, (Date.today + 14))  # proximo dia de pago
              ultNotificacion = @credit.notification_credits.last
              NotificationCredit.update(ultNotificacion.id, revised: 'false', :nextdate => (@credit.nextpay), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              @credit.update_attribute(:nextpay, (mes1))  # proximo dia de pago
              mesnotify = mes1 - 3.day

              ultNotificacion = @credit.notification_credits.last
              NotificationCredit.update(ultNotificacion.id, revised: 'false', :nextdate => mes1, :credit_id => @credit.id)

            end








              # si el credito tiene interes corriente 
              if @credit.interescorriente > 0  
                puts "*****interes coriente 3*****"+@credit.interescorriente.to_s
                calculoInteresCorriente = (@credit.interescorriente / 365.0)/100
                totalCredito = @credit.total + (@credit.total * calculoInteresCorriente.to_f)

                  @credit.update_attribute(:total, totalCredito)  # actualizo el campo total si exite el interes corriente
                
              end





      sum_payments =  @credit.payments_credits.sum(:value)
      Credit.update(@credit.id, :sum_payments => sum_payments)

              if @credit.payday == Date.today
                Credit.update(@credit.id, :state_id => 2) # pagara hoy
                # credit.update_attribute(:state_id, 3)  # paogs al dia
              end
              if @credit.payday > Date.today
                Credit.update(@credit.id, :state_id => 5) # aprobado
                # credit.update_attribute(:state_id, 3)  # paogs al dia
              end 


      format.html { redirect_to :action => :index }
    end    
    
  end




















        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end


end
