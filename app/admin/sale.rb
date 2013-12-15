ActiveAdmin.register Sale do

form do |f|

      f.inputs "Ventas" do
	  # f.input :credit
      # f.input :admin_user
      f.input :admin_user, :as => :select,  :collection => AdminUser.all, selected: current_admin_user.id, :input_html => {} 

	  f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"} 

      f.has_many :sale_products do |order|

        order.inputs "Productos " do 

       

        # order.input :product, :as => "string", input_html: {onKeypress:"return noEnviar(event)", onBlur: "javascript:llenar_campos(this) ", onclick: "javascript:busquedaProducto(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 440px;"}
        # order.input :product_id,  input_html: {id: "product_id", class: "creadit_product_id"}
       

        order.input :inventory_fields, input_html: {onKeypress:"return noEnviar(event)", onBlur: "javascript:salida(this)", onclick: "javascript:busquedaProducto(this)", id: "product", :style => "background-color: #E6E6E6; width: 650px;"}
        order.input :inventory_id,  input_html: {id: "product_id", class: "creadit_product_id"}
        order.input :amount, :input_html => {id: "amount", :style => "width: 60px;"}
        order.input :unit_value, :input_html => {id: 'unit_value', :style => "width: 60px;"}
        order.input :value, :input_html => {onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 60px;"}
          within @head do
               script :src => javascript_path('admin_sale.js'), :type => "text/javascript"
               # script :src => javascript_path('7.js'), :type => "text/javascript"
               # script :src => javascript_path('6.js'), :type => "text/javascript"

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

    f.input :value,  input_html: {onclick: "javascript:sumaValorVenta(this)", id: "total", :style => "background-color: #E6E6E6; width: 260px;"}

		end
		    f.actions
	end










  controller do


    def create

      @sale = Sale.new(params[:sale])

        respond_to do |format|
            if @sale.save
                 @sale.sale_products.each do |salPro|
                    salPro.inventory.update_attribute(:state_inventory_id, 2)
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
