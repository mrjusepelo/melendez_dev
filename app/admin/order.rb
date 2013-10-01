ActiveAdmin.register Order do

	form do |f|


      f.inputs "Pedidos" do

			f.input :date_billed, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
			f.input :date_arrival, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
			f.input :date_limit_pay, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today+30} 
			f.input :date_pay_real, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;"}
			f.input :val_real, :input_html => {:style => " width: 60px;"}


      f.has_many :order_products do |order|
          
        order.inputs 'Productos' do 
        order.input :product, :as => "string",  input_html: {onBlur: "javascript:salida(this)", onclick: "javascript:fondo(this)", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 360px;"}
        # order.input :product, :as => "string",  input_html: {onclick: "$(this).css({ color: '#FFFFFF', background: 'red' });", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
        # order.input :product, :as => "string",  input_html: {onclick: "fondo()", onFocus: "mensaje()", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
        # order.input :product, :as => "string",  input_html: {onFocus: "mensaje()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
        # order.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
        order.input :product_id, as: :hidden 
        within @head do
             script :src => javascript_path('1.js'), :type => "text/javascript"
             # script :src => javascript_path('3.js'), :type => "text/javascript"
             script :src => javascript_path('5.js'), :type => "text/javascript"

        end                 

        end

      end

      f.has_many :consigments do |order|
        order.inputs 'Consignaciones' do 
        order.input :date
        order.input :value
        # rails g model consigment value:integer date:date order:references
        
        end
      end





		end
		    f.actions
	end




















controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end
end