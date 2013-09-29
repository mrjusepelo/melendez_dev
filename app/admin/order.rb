ActiveAdmin.register Order do

	form do |f|
      within @head do
           script :src => javascript_path('1.js'), :type => "text/javascript"
           # script :src => javascript_path('2.js'), :type => "text/javascript"
           script :src => javascript_path('3.js'), :type => "text/javascript"

      end		

      f.inputs "Pedidos" do

			f.input :date_billed, :as => :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
			f.input :date_arrival
			f.input :date_limit_pay
			f.input :date_pay_real
			f.input :val_real

# rails g model order date_billed:date date_arrival:date date_limit_pay:date date_pay_real:date val_real  
      # f.has_many :images do |im|

      # f.has_many :products do |im|
      #   im.inputs 'Productos' do 
      #     im.input :product, :as => "string", input_html: {onFocus: "mensaje()", onBlur: "salida()", class: "cssClass", id: "product", name: "product", :style => "background-color: #E6E6E6; width: 160px;"}
      #     im.input :product_id, as: :hidden
      #   end
      # end







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