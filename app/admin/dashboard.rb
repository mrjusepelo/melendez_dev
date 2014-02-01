ActiveAdmin.register_page "Dashboard" do
# menu false
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end



# h3 section "Productos Recientes" do
#     table_for Product.order("created_at desc").limit(5) do |t| 
#          # table_for current_admin_user.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|   
#     # table_for Product.brand.limit(5) do
#     t.column :name do |product|
#         link_to product.name, admin_product_path(product)
#     end 
#     t.column :created_at 
# # t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
#     end
#     strong { link_to "View All Products", admin_products_path }
# end


h3 section "Notificaciones de Cuentas por Pagar Proximos (3) Dias" do
         # @ultimoPago = Notification.where(nextdate: Date.today)
    
    # notificaciones pasadas sin ser revizadas
     # @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

      

    table_for (Notification.where(nextdate: (Date.today..(Date.today + 3)), revised: false)) do |t| 
         # table_for current_admin_user.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|   
    # table_for Product.brand.limit(5) do
        t.column "Pedido Numero" do |prov|
            link_to prov.order.id, admin_order_path(prov.order)
        end
        t.column "Proveedor" do |prov|
            link_to prov.order.supplier.name, admin_supplier_path(prov.order.supplier)
        end 
        t.column "Notificacion" do |noti|
            link_to noti.id, admin_order_notifications_path(noti.order.id)
        end     
        t.column :created_at 
        t.column "Dejar de Ver" do |noti|
            "Efectua el pago"
        end 
# t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
    end
    strong { link_to "Ver Todos las Compras a Proveedores", admin_orders_path }
end



h3 section "Notificacion de Cuentas por Pagar para Hoy" do

    table_for Notification.where(nextdate: Date.today, revised: false ).limit(5) do |t| 
        t.column "Pedido Numero" do |prov|
            link_to prov.order.id, admin_order_path(prov)
        end
        t.column "Proveedor" do |prov|
            link_to prov.order.supplier.name, admin_supplier_path(prov.order.supplier)
        end 
        t.column "Notificacion" do |noti|
            link_to noti.id, admin_order_notifications_path(noti.order.id)
        end     
        t.column :created_at 
        t.column "Dejar de Ver" do |noti|
            "Efectua el pago"
        end 
    end

    strong { link_to "Ver Todos las Compras a Proveedores", admin_orders_path }
end


# pagos pendientes
h3 section "Notificacion de Cuentas por Pagar Antiguas ("+ Order.where(state_id: 1).count.to_s + ")"  do

    # table_for Order.where(state_id: 1, published: true).limit(5) do |t| 
    table_for Order.where(state_id: 1, published: true) do |t| 
        t.column "Pedido Numero" do |order|
            link_to order.id, admin_order_path(order)
        end
        t.column "Proveedor" do |order|
            link_to order.supplier.name, admin_supplier_path(order.supplier)
        end 
        t.column "Notificacion" do |order|
            link_to order.notifications.last.id, admin_order_notifications_path(order)
            # link_to noti.id, admin_order_notifications_path(noti.order.id)
        end     
        t.column :created_at 
        t.column "Dejar de Ver" do |noti|
            "Efectua el pago" # para cambiar estado 
        end         
    end
    strong { link_to "Ver Todos las Compras a Proveedores", admin_orders_path }
end



h3 section "Notificaciones de Creditos con Pagos para HOY" do

# @order =  Order.joins('LEFT OUTER JOIN notifications ON notifications.order_id = orders.id AND orders.state_id != 6 AND notifications.nextdate < ?', Date.today)

    table_for NotificationCredit.where(nextdate: Date.today, revised: false ) do |t| 

             t.column "Estado" do |credito|
                credito.credit.state.name
            end               
            t.column "Credito Numero" do |credito|
                link_to credito.credit.id, admin_credit_path(credito.credit)
            end
            t.column "Cliente" do |noti|
                cliente = noti.credit.clients.where(credit_id: noti.credit.id, :buyer => "true").first
                link_to cliente.name, admin_client_path(cliente.id)
            end 
            t.column :created_at 
            t.column "Dejar de Ver Notificacion" do |noti|
                # link_to noti.id, admin_credit_notification_credits_path(noti.credit.id)
                  link_to noti.id, edit_admin_credit_notification_credit_path(noti.credit.id, noti.id)

            end     
    end #fin de tabla

            strong { link_to "Ver Todos los Creditos a Clientes", admin_credits_path }
        # end #if si pedido terminado
    # end #each notify
end





h3 section "Notificaciones de Creditos sin Revizar  " do

    table_for NotificationCredit.where(revised: false) do |t| 

             t.column "Estado" do |credito|
                credito.credit.state.name
            end               
            t.column "Credito Numero" do |credito|
                link_to credito.credit.id, admin_credit_path(credito.credit)
            end
            t.column "Cliente" do |noti|
                cliente = noti.credit.clients.where(credit_id: noti.credit.id, :buyer => "true").first
                link_to cliente.name, admin_client_path(cliente.id)
            end 
            t.column :created_at 
            t.column "Dejar de Ver Notificacion" do |noti|
                # link_to noti.id, admin_credit_notification_credits_path(noti.credit.id)
                  link_to noti.id, edit_admin_credit_notification_credit_path(noti.credit.id, noti.id)

            end     
    end #fin de tabla
            strong { link_to "Ver Todos los Creditos a Clientes", admin_credits_path }
end















# clients = Client.includes(:address).limit(10)
# clients.each do |client|
#   puts client.address.postcode
# end





    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
