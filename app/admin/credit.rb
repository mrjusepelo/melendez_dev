ActiveAdmin.register Credit do
  menu :parent => "Creditos"


  index do 
    selectable_column
    column :id
    column "Cliente" do |credit|
			reg_client = credit.clients.where(credit_id: credit.id, :buyer => "true").first

    	if defined?(reg_client.name)
	
			reg_client.name
		else
		"Sin asignar"	
		end
    end

    column "Fiador" do |credit|
    	 # client = Client.find(10)
	   	 # fiador = Client.find(credit.id)

		 fiador = Client.where(credit_id: credit.id, bondsman: 'true').first
		 # fiador = credit.clients.where(credit_id: credit.id, bondsman: 'true').first


  		if defined? fiador.name
  			fiador.name
  		else
  			"Sin asignar"
  		end

    		
    end
    column :total
    column :date
    column :state
    column :sum_payments
    column :created_at
    column :updated_at
    # actions do |product|
      # link_to "Agregar a Inventario", new_admin_inventory_path(product), :class => "member_link"
    # end
    default_actions
  end    

















	form do |f|

      # if @order.id.nil?
      f.inputs "Creditos" do
      f.input :payment_mode
	  f.input :date, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
      f.input :state
      f.input :description,   input_html: {:size => '3'}

      f.has_many :credit_products do |order|
          
        order.inputs 'Productos' do 
        order.input :product, :as => "string",  input_html: {onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        order.input :product_id,   input_html: {id: "product_id"}
        order.input :amount, :input_html => { :style => "width: 60px;"}
        order.input :value, :input_html => {class: "val_product",  :style => "width: 60px;"}
          within @head do
               script :src => javascript_path('1.js'), :type => "text/javascript"
               script :src => javascript_path('5.js'), :type => "text/javascript"
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
            client.input :buyer, :input_html => {:checked => "true"}
            client.input :bondsman
# model client name:string document:string address:string phone:string neihborhood:string city:references buyer:boolean bondsman:boolean

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
