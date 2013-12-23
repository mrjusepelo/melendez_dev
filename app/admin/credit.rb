ActiveAdmin.register Credit do
# config.comments = true
  menu :parent => "Creditos"
  # actions :all, :except => [:new, :create, :edit, :upadate, :destroy]
# actions :all, :except => [:destroy]
# actions :index, :show, :new, :create, :update, :edit
  actions :all, :except => [:destroy, :edit, :update]


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
      @credit = Credit.new(params[:credit])

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
      # number_to_currency payments.sum_payments
      number_to_currency payments.sum_payments
    end

    column "Proximo Pago" do |credit|

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
   diaPago = "Hoy"
 else
  diaPago
 end

end













    end
















    column "Modo de Pago" do |credit|
        if defined?(credit.payment_mode.name)
          modoPago = credit.payment_mode.name
        else
          modoPago = "Sin asignar"

        end
    end

    # column :sum_payments => price
    column :created_at
    column :updated_at

   
    column "" do |credit|

       if credit.state_id.to_i == 4
          link_to("Ver", admin_credit_path(credit)) + "  " + "Nada por hacer..."
       else   
            link_to("Generar Contrato",  contract_admin_credit_path(credit), :class => "member_link") + "  " + 
            link_to("Pagos",  admin_credit_payments_credits_path(credit), :class => "member_link") + "  " +
           link_to("Cancelar", cancelar_admin_credit_path(credit), :method => :put, :confirm => "Estas Seguro(a)?")
          # default_actions

      end
    end
 end









# member_action :cancelar, :method => :get do
member_action :cancelar, :method => :put do
      
  @credit = Credit.find(id = params[:id])
      # credit.lock!

      @credit.update_attribute(:state_id, 4)
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
    send_data(kit.to_pdf, :filename => 'report.pdf', :type => 'application/pdf', :disposition => 'inline')
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
        order.input :inventory_id,  input_html: {id: "product_id", class: "creadit_product_id"}
        order.input :amount, :input_html => {onChange:"", id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {onBlur:"", id: "unit_value", :style => "width: 60px;"}
        order.input :value, :input_html => {onBlur:"", onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 60px;" }
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
            payment.input :value , :input_html => {onChange:"validarSiNumero(this)"}
            payment.input :description,   input_html: {:size => '3'}
            
          end
      end

      f.has_many :support_documents do |document|
            document.inputs 'Pagos' do 
            document.input :name
            document.input :route #, :as => :datepicker  , :input_html => {:name => "date"}
            
          end
      end      


      f.input :total,  input_html: {onChange:"", onclick: "javascript:sumavalorcredito(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}
      f.input :number_payments, :input_html => {onChange:"validarSiNumero(this)", id: "number_payments", :style => "width: 60px;"}
      f.input :value_payments, :input_html => {onChange:"validarSiNumero(this)", id: "value_payments",onclick: "javascript:calcularPagos(this)", :style => "width: 60px;"}
		end
		    f.actions
	end











  #  show do |product|
  #     attributes_table do
        
  #       row :id
  #       row :color_id do
  #         span :class => "colors", :style => "background-color: #{product.color.sample}; border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px; color:#F5F5F5;" do 
  #           product.color.name
  #         end

  #       end

  #       row :size_id
  #       row :created_at
  #       row :updated_at
  #       row :comming_soon

  #     end
  # end
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
        row :total
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
              if @credit.payday == Date.today
                Credit.update(@credit.id, :state_id => 2) # pagara hoy
                # credit.update_attribute(:state_id, 3)  # paogs al dia
              end
              if @credit.payday > Date.today
                Credit.update(@credit.id, :state_id => 5) # aprobado
                # credit.update_attribute(:state_id, 3)  # paogs al dia
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
