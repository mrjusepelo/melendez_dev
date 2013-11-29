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
        product = Product.where(id: inventory.product_id).first
        brand = Brand.where(id: product.brand_id).first
        row "Marca" do
          brand.name
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

  end
  f.inputs "Datos del Producto" do
      # Campo sobre escrito momentaneo para Json de nombre del Producto
     f.input :serial, as: :hidden, input_html: {name: "inventory_json", id: "inventory_json", value: inventory.product.to_json}

      # f.input :product, :as => "string", input_html: {id: "product", name: "product_aux"}
      f.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
      f.input :product_id , as: :hidden,  input_html: {id: "product_id", class: "inventory_product_id"}


      # f.input :product
      f.input :barcode, :label => "Cantidad", :input_html => { id: "amount", name: "amount", :style => "background-color: #E6E6E6; width: 60px;"} 
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
    column "Nombre" do |inventory|
       inventory.product.name
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
    # column :user
    column :created_at
    column :updated_at
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
                     :date_out => params[:inventory][:date_out], :serial => params[:inventory][:serial]
                    )
                end

            redirect_to :action => :index
            # 'admin/products#index'
        end
          before_filter :protected_attributes
            def protected_attributes
              params.permit!
            end
    end
end