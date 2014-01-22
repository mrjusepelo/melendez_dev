ActiveAdmin.register Sale do
  menu :label => 'Ventas', :parent => "Ventas Efectivo"
  # menu :parent => "Ventas Efectivo" ,:priority => 1
  # menu :parent => "Ventas Efectivo" #, url: '/admin/resque'


# http://stackoverflow.com/questions/9620165/add-custom-items-at-header-menu-in-activeadmin
  # admin.build_menu do |menu|
  #   menu.add :label => 'Custom Menu' do |submenu|
  #     submenu.add :label => 'Custom Link', :url => custom_path
  #   end
  # end




  # filter :sale_products, :label => 'Registro en Productos Vendidos', :as => :select, :collection => SaleProduct.find(:all, :order => "id").map(&:sale_id)
  filter :admin_user
  filter :value
  filter :date



  filter :created_at
  filter :updated_at
  

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
        order.input :inventory_id, as: :hidden,  input_html: {id: "product_id", class: "creadit_product_id"}
        order.input :amount, :input_html => {onChange: "",id: "amount", :style => "width: 260px;"}
        order.input :unit_value, :input_html => {onChange: "",id: 'unit_value', :style => "width: 260px;"}
        order.input :value, :input_html => {onChange: "", onclick: "javascript:valorproductos(this)",class: "val_product", id: "val_product",  :style => "width: 260px;"}
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






show do |sale|
  
      attributes_table do
        row :id
        row :date
        row :value
        row :admin_user

        row  "Productos " do
          table do 
            
            tr do 
              td :style => "width: 200px; background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                  "Nombre"
                end      
              end
              td id: "Marca", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Marca"
                end
              end       
              td id: "cantidad", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Cantidad"
                end
              end
              td id: "valor_unidad", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Valor Unidad"
                end
              end
              td id: "valor", :style => "background-color: rgb(221, 221, 221); text-align: center;" do
                span :class => "colors", :style => " border:none; border-radius: 30px; width: 30px; height:30px; padding: 5px;" do 
                 "Valor"
                end
              end              


            end


           # sale.sale_products.each do |prod|
           sale.sale_products.each do |prod|
              tr do 
                td :style => "text-align: center;" do 
                  prod.inventory.product.name
                end
                td :style => "text-align: center;" do 
                  prod.inventory.product.brand.name
                end
                td :style => "text-align: center;" do 
                  prod.amount
                end 
                td :style => "text-align: center;" do 
                  prod.unit_value
                end   
                td :style => "text-align: center;" do 
                  prod.value
                end                                                                

              end
           end



          end
        end
      end




      active_admin_comments

    end

















































  controller do


    def destroy
      @sale = Sale.find(params[:id])

        @sale.sale_products.each do |pro_inventory|
          pro_inventory.inventory.update_attribute(:state_inventory_id, 1) 
           # Inventory.update(pro_inventory.inventory.id, :state_inventory_id => 1)
        end
      @sale.destroy

      redirect_to admin_sales_path()
    end



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
