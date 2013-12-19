ActiveAdmin.register Sale do

form do |f|

  f.inputs "Ventas" do
	  # f.input :credit
      # f.input :admin_user
    

    if sale.id
      f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
    else  
      f.input :admin_user_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
      f.input :admin_creator_id, :as => :hidden, :input_html => {:value => current_admin_user.id} 
    end #condicional de es un edit


	  f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 

      f.has_many :sale_products do |order|

        order.inputs "Productos " do        

        order.input :inventory_fields, input_html: {onKeypress:"return noEnviar(event)", onBlur: "javascript:salida(this)", onclick: "javascript:busquedaProducto(this)", id: "product", :style => "background-color: #E6E6E6; width: 650px;"}
        order.input :inventory_id,  input_html: {id: "product_id", class: "creadit_product_id"}
        order.input :amount, :input_html => {onChange: "validarSiNumero(this.value);",id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {onChange: "validarSiNumero(this.value);",id: 'unit_value', :style => "width: 60px;"}
        order.input :value, :input_html => {onChange: "validarSiNumero(this.value);", onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 60px;"}
          within @head do
               script :src => javascript_path('admin_sale.js'), :type => "text/javascript"

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

            # client.input :buyer, :input_html => {onclick: "javascript:eleccionComprador(this)"}        
            # client.input :bondsman,  :input_html => {onclick: "javascript:eleccionFiador(this)"}      
          end
      end


      f.has_many :pay_consigments do |payConsig|
            payConsig.inputs 'Consignaciones' do 
            payConsig.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
            payConsig.input :name #, :as => :datepicker  , :input_html => {:name => "date"}
            payConsig.input :num_register  #, :input_html => {:name => "value", :style => "width: 60px;"}
            payConsig.input :value  #, :input_html => {:name => "value", :style => "width: 60px;"}
            payConsig.input :num_account  #, :input_html => {:name => "value", :style => "width: 60px;"}

          end
      end

      f.has_many :pay_efectives do |payEffec|
            payEffec.inputs 'Efectivo' do 
            payEffec.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 
            payEffec.input :name #, :as => :datepicker  , :input_html => {:name => "date"}
            payEffec.input :value #, :input_html => {:name => "value", :style => "width: 60px;"}
          end
      end





    f.input :value,  input_html: {onclick: "javascript:sumaValorVenta(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}

		end
		    f.actions
	end








3385056


  index do 
    selectable_column
    column :id
    column :date
    column :value
    column :admin_user
    column 'Admin Creador' do |admin|      
      creador = AdminUser.select(:name).where(:id => admin.admin_creator_id).first

      if defined? creador.name
         creador.name
      else
        creador = "No definido"
      end
    end

    column :created_at
    column :updated_at
    actions do |p|
      link_to "Imprimir factura",  bill_admin_sale_path(p), :class => "member_link"
    end
  end 

member_action :bill, :method => :get do
@bill =  Sale.find(id = params[:id])


# vista creada en views/admin/credits/bill
     html = render_to_string(:action => "bill.html.erb", :layout => false)
      kit = PDFKit.new(html)
      kit.stylesheets << 'vendor/assets/stylesheets/style_bill.css'
      kit.stylesheets << 'vendor/assets/stylesheets/style_bill2.css'
    send_data(kit.to_pdf, :filename => 'facturaPago.pdf', :type => 'application/pdf', :disposition => 'inline')
end














  controller do


    def create

      @sale = Sale.new(params[:sale])

        respond_to do |format|
            if @sale.save
                 @sale.sale_products.each do |salPro|
                    salPro.inventory.update_attribute(:state_inventory_id, 2)
                 end
                 @sale.clients.each do |cliSal|
                    cliSal.update_attribute(:buyer, "true")
                 end
              format.html{redirect_to :action => :index}
                       
            else
              format.html{render "new", error: "Error"}
            end
        end

    end



















           before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end


end
