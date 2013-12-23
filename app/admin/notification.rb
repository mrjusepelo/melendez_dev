ActiveAdmin.register Notification do

  menu :parent => "Compra Proveedores"
  belongs_to :order
  

  index do
    # column :name
    # row :nextdate
    column :id
    column "Proxima Notificacion", :nextdate 
    column "Pedido", :order_id 
    column "Revisado", :revised do |notification|
        if defined?(notification.revised)
          revision = notification.revised
          if revision.to_s == "false"
	          revision = "Sin Ver"
		  elsif revision.to_s == "true"
	          revision = "Visto"
          end
        else
          revision = "Sin Revisar"
	    end
    end
    column :created_at
    column :updated_at 
 	# column "Title" do |notification|
  #           # link_to("Generar Contrato",  contract_admin_credit_path(notification), :class => "member_link") #+ "  " + 
  #   	    link_to 'post.title', notification_admin_notification_path(notification)
  #   	    # link_to 'post.title', notification_admin_notifications_path(notification)
  #       # link_to("Cancelar", cancelar_admin_credit_path(credit), :method => :put, :confirm => "Estas Seguro(a)?")

  # 	end
    default_actions
  end


  form do |f|
	f.inputs "Resisado ?" do
		f.input :revised
	end
	f.actions
	
end   


# member_action :notification, :method => :get do
# # collection_action :notification, :method => :post do
# @credit = Notification.find(id = params[:id])
#     # redirect_to :action => "/admin/notifications/notification.html.erb"
# # /admin/items/add_me
# # @nameUser = current_admin_user.name
# # # vista creada en views/admin/credits/contract
# #      html = render_to_string(:action => "notification.html.erb", :layout => false)
# #       kit = PDFKit.new(html)
# #       kit.stylesheets << 'vendor/assets/stylesheets/style.css'
#     # send_data(kit.to_pdf, :filename => 'report.pdf', :type => 'application/pdf', :disposition => 'inline')
# end








controller do
	def update
	  @notification = Notification.find(params[:id])

	  update! do |format|
	  	if @notification.order.state_id != 6
			
			@order = @notification.order
            # crea las Notificationes con 3 dias de anticipacion para cada una
            if @order.payment_mode_id.to_i == 1
              Notification.create(revised: 'false', :nextdate => (Date.today + 1), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 2
              Notification.create(revised: 'false', :nextdate => (Date.today + 4), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 3
              Notification.create(revised: 'false', :nextdate => (Date.today + 11), :order_id => @order.id)

            elsif @order.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              mesnotify = mes1 - 3.day
              Notification.create(revised: 'false', :nextdate => mesnotify, :order_id => @order.id)  

            end

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
