ActiveAdmin.register Notification do

  menu :parent => "Compra Proveedores"
  belongs_to :order
  

  index do
    # column :name
    # row :nextdate
    column "Proxima Notificacion", :nextdate 
    column "Pedido", :order_id 
    column "Revisado", :revised 
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
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
