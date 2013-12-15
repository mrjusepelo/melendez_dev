ActiveAdmin.register Inventory do
  menu :parent => "Inventario"
  
# batch_action :flag do |selection|
#       Post.find(selection).each do |post|
#         post.flag! :hot
#       end
# end

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
        row :warranty
        row :date_in
        row :date_out
        row :created_at
        row :updated_at
      end
    end
  
  
  batch_action :Imprimir_codigos do |selection|
    # do_something
    # puts "************************ "selection.id

  end


 # filter :barcode, :as => :string 

  # filter :barcode, :as => :string, :collection => lambda{ Inventory.barcodes }
  # filter :author, :as => :select, :collection => lambda{ Product.authors }
   
  # actions :all, :except => [:destroy]


  form do |f|
      within @head do
           script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('2.js'), :type => "text/javascript"
           script :src => javascript_path('3.js'), :type => "text/javascript"
           script :src => javascript_path('admin_inventory.js'), :type => "text/javascript"

  end
  f.inputs "Datos del Producto" do
      # Campo sobre escrito momentaneo para Json de nombre del Producto
     f.input :supplier, as: :hidden, input_html: {name: "inventory_json", id: "inventory_json", value: inventory.product.to_json}

      # f.input :product, :as => "string", input_html: {id: "product", name: "product_aux"}
      f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
      f.input :product_id ,   input_html: {id: "product_id", class: "inventory_product_id"}
      # f.input :product_id , as: :hidden,  input_html: {id: "product_id", class: "inventory_product_id"}


      # f.input :product
      f.input :barcode, :label => "Cantidad", :input_html => {onBlur: "createSerials(this)", id: "amount", name: "amount", :style => "background-color: #E6E6E6; width: 60px;"} 
      f.input :serial
      f.input :supplier
      f.input :vale_buy
      f.input :vale_sale
      f.input :warranty
      f.input :date_in,  :as => "string", :input_html => {id: "datepi", :style => "background-color: #E6E6E6; width: 60px;", :value => Date.today}
      # f.input :date_in,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => DateTime.now.to_i}
      f.input :date_out,  :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => "click aqui"}
      # f.input :comming_soon
      # image_tag("/icons/icon.gif", :height => '32', :width => '32') # =>

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



              end
          
        else
          estado = "Sin asignar"
        end

    end
    # actions do |product|
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    # end
    default_actions
  end    



    controller do

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
                     :date_out => params[:inventory][:date_out], :serial => params['serial'.to_s+i.to_s]
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