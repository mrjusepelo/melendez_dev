ActiveAdmin.register Inventory do
  menu :parent => "Inventario"
  
  # filter :product, :label => 'Nombre de Producto', :as => :select, :collection => Product.find(:all, :order => "name")
  # filter :supplier, :label => 'Nombre de Proveedor', :as => :select, :collection => Supplier.find(:all, :order => "name")
  # filter :state_inventory, :as => :select, :collection => StateInventory.find(:all, :order => "name")
  # filter :sale_products, :as => :select, :collection => SaleProduct.find(:all, :order => "id").map(&:id)
  filter :barcode
  filter :serial
  filter :iva
  filter :vale_buy
  filter :vale_sale
  filter :warranty
  filter :date_in
  filter :date_out
  filter :created_at
  filter :updated_at

# filtros pendientes
# SALE PRODUCTS
# SALES
# CREDIT PRODUCTS
# CREDITS




# batch_action :flag do |selection|
#       Post.find(selection).each do |post|
#         post.flag! :hot
#       end
# end




  batch_action :imprimir_codigos do |selection|

      @codigos =  Inventory.find(selection)
     # html = render_to_string(:action => "imprimir_codigos.html.erb", :layout => false)
      # kit = PDFKit.new(html)
      # kit.stylesheets << 'vendor/assets/stylesheets/style.css'
      # kit.javascripts << 'vendor/assets/javascripts/1.js'
    # send_data(kit.to_pdf, :filename => 'codigosBarra.pdf', :javascript_delay=>9000, :type => 'application/pdf', :disposition => 'inline')    


    # render_to_string(:action => "imprimir_codigos", :layout => false)

    render :action => "imprimir_codigos", :layout => true

       # respond_to do |format|
       #    # format.json {render :json => {:success => true}}
       #   format.html { redirect_to :action => "imprimir_codigos.html.erb"}
       #  end
  end




    show do |inventory|
      attributes_table do 
        row :id
        row :product_id
        # product = Product.where(id: inventory.product_id).first
        # brand = Brand.where(id: product.brand_id).first
        row "Marca" do
          if defined?(inventory.product.brand.name)
           marca = inventory.product.brand.name
          else
            marca = "Sin asignar"
          end
        end
        row :supplier_id
        row :barcode
        row :serial
        row :vale_buy
        row :vale_sale
        row :iva
        row :warranty
        row :date_in
        row :date_out
        row :created_at
        row :updated_at
      end
    end
  
  



 # filter :barcode, :as => :string 

  # filter :barcode, :as => :string, :collection => lambda{ Inventory.barcodes }
  # filter :author, :as => :select, :collection => lambda{ Product.authors }
   
  # actions :all, :except => [:destroy]


  form do |f|
      within @head do
           script :src => javascript_path('1.js'), :type => "text/javascript"
           script :src => javascript_path('3.js'), :type => "text/javascript"
           script :src => javascript_path('admin_inventory.js'), :type => "text/javascript"
           script :src => javascript_path('validation.js'), :type => "text/javascript"
           # script :src => javascript_path('http://livevalidation.com/javascripts/src/1.3/livevalidation_standalone.js'), :type => "text/javascript"
           script :src => javascript_path('validation_form_inventory.js'), :type => "text/javascript"

  end
  f.inputs "Datos del Producto" do
      # Campo sobre escrito momentaneo para Json de nombre del Producto
     f.input :supplier, as: :hidden, input_html: {name: "inventory_json", id: "inventory_json", value: inventory.product.to_json}

      # f.input :product, :as => "string", input_html: {id: "product", name: "product_aux"}
      f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
      f.input :product_id, :as => :hidden,   input_html: {id: "product_id", class: "inventory_product_id"}
      # f.input :product_id , as: :hidden,  input_html: {id: "product_id", class: "inventory_product_id"}


      # f.input :product
      f.input :barcode, :label => "Cantidad", :input_html => {onBlur: "createSerials(this)", id: "amount", name: "amount", :style => "background-color: #E6E6E6; width: 60px;"} 
      f.input :serial, :input_html => {id: "inventory_serial"}
      f.input :supplier, :input_html => {id: "inventory_supplier_id"}
      f.input :vale_buy, as: :string, :input_html => {id: "inventory_vale_buy", :style => " width: 260px;"}
      f.input :vale_sale, as: :string, :input_html => {id: "inventory_vale_sale", :style => " width: 260px;"}
      f.input :iva, :as => "string", :input_html => {id: "inventory_iva", :style => " width: 60px;", :value => 0}
      f.input :warranty, as: :string, :input_html => {id: "warranty", :style => "width: 60px;"}
      f.input :date_in,  :as => "string", :input_html => {id: "datepi", :style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      # f.input :date_in,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => DateTime.now.to_i}


      if inventory.id
          f.input :date_out,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
          f.input :state_inventory_id,  :as => :select, :include_blank => false, :collection => StateInventory.where('id < 4'), :input_html => {id: "state_inventory", :style => ""}
      # f.input :profile, as: :select, :collection => Profile.where.not('id < 3')
           # f.input :role, :as => :select, :include_blank => false, :collection => [["Selecciona", nil], ["Super", "Super"], ["Super Lectura", "Super Lectura"], ["Pedidos", "Pedidos"], ["Productos", "Productos"]]
     
        else
      # si se va a ingresar al inventario no lo muestro para que no se almacene
      f.input :date_out,  :as => :hidden, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => "click aqui"}
      f.input :state_inventory_id, as: :hidden, :input_html => {id: "state_inventory", :style => "background-color: #E6E6E6; width: 60px;", :value => 1}
      end

      

  end

  f.actions
end



  index do 
    selectable_column
    column :id
    column :barcode
    column :serial
    #column "Codigo de barras", :barcode
     # column "My Custom Title", :barcode
    column "Producto" do |inventory|
       # inventory.product.name
        if defined?(inventory.product.name)
         nombreP = inventory.product.name
        else
          nombreP = "Sin asignar"
        end       
     end
    column "Marca" do |inventory|
        if defined?(inventory.product.brand.name)
         marca = inventory.product.brand.name
        else
          marca = "Sin asignar"
        end
     end         
    column :vale_buy
    column :vale_sale
    column :iva
    column :warranty
    column :date_in
    column :date_out
    column :created_at
    # column :updated_at
    # :state_inventory_id
    column "Estado de Producto" do |inventory|
        if defined?(inventory.state_inventory_id)
              if inventory.state_inventory_id.to_i == 1
                  span :class => "", :style => " border:none; background-color: rgb(44, 145, 40); color: white;height:30px; padding: 5px;" do 
                    estado = inventory.state_inventory.name
                  end
              elsif inventory.state_inventory_id.to_i == 2
                   span :class => "", :style => " border:none; background-color: black; color: white;height:30px; padding: 5px;" do 
                      estado = inventory.state_inventory.name
                   end               
              elsif inventory.state_inventory_id.to_i == 3
                  span :class => "", :style => " border:none; background-color: rgb(165, 48, 48); color: white;height:30px; padding: 5px;" do 
                    estado = inventory.state_inventory.name
                  end  
              elsif inventory.state_inventory_id.to_i == 4
                  span :class => "", :style => " border:none; background-color: rgb(165, 165, 164); color: black;height:30px; padding: 5px;" do 
                    estado = inventory.state_inventory.name
                  end 

              end
          
        else
          estado = "Sin asignar"
        end

    end
    column "" do |inventory|

       if inventory.state_inventory_id.to_i == 4
          link_to("Ver", admin_inventory_path(inventory)) + "  " + "Nada por hacer..."
       else   
            link_to("Ver",  admin_inventory_path(inventory), :class => "member_link") + "  " + 
            link_to("Editar",  edit_admin_inventory_path(inventory), :class => "member_link") + "  " + 
           link_to("Cancelar", cancelar_admin_inventory_path(inventory), :method => :put, :confirm => "Estas Seguro(a)?")
      end
    end
    # default_actions
  end    








member_action :cancelar, :method => :put do
  @inventory = Inventory.find(id = params[:id])

      @inventory.update_attribute(:state_inventory_id, 4)
    redirect_to :action => :index, :notice => "Servicio #{@inventory.id}"

  #   update! do |format|

  #       format.html { redirect_to :action => :index }
  #   end    

end






    controller do



    def destroy
      @inventory = Inventory.find(params[:id])

        @inventory.each do |pro_inventory|
          # no elimina pero pone el registro en estado 4 cancelado
          pro_inventory.update_attribute(:state_inventory_id, 4) 
           # Inventory.update(pro_inventory.inventory.id, :state_inventory_id => 1)
        end
        
      # @inventory.destroy

      redirect_to admin_inventories_path()
    end

        def create
            
            timestamp = (DateTime.now.to_i).to_s
            # Convert number of seconds into Time object.
            # Time.at(time)

              (1..params[:amount].to_i).each do |i|
                  Inventory.create(
                    :product_id => params[:inventory][:product_id], :barcode => timestamp+""+i.to_s,
                     :supplier => params[:inventory][:supplier],
                     :vale_buy => params[:inventory][:vale_buy],:vale_sale => params[:inventory][:vale_sale],
                     :warranty => params[:inventory][:warranty],:date_in => params[:inventory][:date_in],
                     :date_out => params[:inventory][:date_out], :serial => params['serial'.to_s+i.to_s], 
                     :state_inventory_id => params[:inventory][:state_inventory_id], :iva => params[:inventory][:iva]
                    )
                end
            redirect_to :action => :index
            # 'admin/products#index'

        end


     
     def edit
            @inventory = Inventory.find(params[:id])
            puts "******************************"+@inventory.id.to_s

      end

        def update
            # @credit = Credit.find(params[:id])
            @inventory = Inventory.find(params[:id])
            puts "******************************"+@inventory.to_s
              Inventory.update(@inventory.id, :product_id => params[:product])
              Inventory.update(27, product_id: 2)

            puts "****************************************"+params[:product].to_s

              # Inventory.update(@inventory.id, :product_id => params[:inventory][:product_id], :supplier_id => params[:supplier_id],
              #                 :barcode => params[:barcode], :vale_buy => params[:vale_buy], :vale_sale => params[:vale_sale],
              #                 :warranty => params[:warranty], :date_in => params[:date_in], :date_out => params[:date_out],
              #                 :updated_at => params[:updated_at], :serial => params[:serial]
              #                 )
              
              # credit = Credit.find(2)
              # credit.update_attribute(:state_id, 3)
              # Credit.update(credit.id, :state_id => 3)

        # #   @inventory = Inventory.find(params[:id])


          update! do |format|
        # #     # sum_payments =  @credit.payments_credits.sum(:value)
        # #     # Credit.update(@credit.id, :sum_payments => sum_payments)
        # #     Inventory.update(@inventory.id, :sum_payments => sum_payments)
            format.html { redirect_to :action => :index }
          end    
        end


          before_filter :protected_attributes
            def protected_attributes
              params.permit!
            end
    end
end