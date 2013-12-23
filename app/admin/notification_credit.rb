ActiveAdmin.register NotificationCredit do

menu :parent => "Notificaciones"
  belongs_to :credit
  

  index do
    # column :name
    # row :nextdate
    column :id
    column "Proxima Notificacion", :nextdate 
    column "Pedido", :credit_id 
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






controller do
	def update
	  @notification = NotificationCredit.find(params[:id])

	  update! do |format|
	  	if @notification.credit.state_id != 6
			
			@credit = @notification.credit
            # crea las Notificationes con 3 dias de anticipacion para cada una
            if @credit.payment_mode_id.to_i == 1
              NotificationCredit.create(revised: 'false', :nextdate => (Date.today + 1), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 2
              NotificationCredit.create(revised: 'false', :nextdate => (Date.today + 4), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 3
              NotificationCredit.create(revised: 'false', :nextdate => (Date.today + 11), :credit_id => @credit.id)

            elsif @credit.payment_mode_id.to_i == 4
              hoy = Date.today
              mes1 = hoy + 1.month
              mesnotify = mes1 - 3.day
              NotificationCredit.create(revised: 'false', :nextdate => mesnotify, :credit_id => @credit.id)  

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
