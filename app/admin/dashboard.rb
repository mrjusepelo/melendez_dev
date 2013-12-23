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


h3 section "Notificaciones de Pedidos Proximos a Pagar (3) Dias" do
         # @ultimoPago = Notification.where(nextdate: Date.today)
    
    # notificaciones pasadas sin ser revizadas
     # @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

    table_for Notification.where("nextdate = ? AND revised = 'false'", (Date.today + 3)).limit(5) do |t| 
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
# t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
    end
    strong { link_to "Ver Todos los Pedidos", admin_orders_path }
end



h3 section "Notificacion de Pagos para Hoy" do

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
        end
    strong { link_to "Ver Todos los Pedidos", admin_orders_path }
end


# pagos pendientes
h3 section "Notificacion de Pedidos con Pagos pendientes ("+ Order.where(state_id: 1).count.to_s + ")"  do

    table_for Order.where(state_id: 1).limit(5) do |t| 
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
        end
    strong { link_to "Ver Todos los Pedidos", admin_orders_path }
end



h3 section "Notificaciones de Pedidos Atrasados sin Pagar" do
# falta incluir que el estado no sea terminado ni cancelado
    @notify = Notification.where("nextdate < ? AND revised = 'false'", Date.today).limit(5)
  #   Notification.where(Order.arel_table[:state_id].not_eq(6))
  # Notification.where(Order.where.not(:state_id => 6))
  # Notification.where(Notification.order.where.not(:state_id => 6))


        # @notify.orders.each do |noti|
            # @a = noti.id
        # end

# @order =  Order.joins('LEFT OUTER JOIN notifications ON notifications.order_id = orders.id AND orders.state_id != 6 AND notifications.nextdate < ? ', Date.today)



    table_for @notify do |t| 
    # table_for notify = Notification.where("nextdate < ? AND revised = 'false'", Date.today).limit(5) do |t| 
        # @notify.each do |noti|
            # if noti.order.state_id.to_i != 6
                 t.column "Estado" do |prov|
                    prov.order.state.name
                end               
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
            end
            strong { link_to "Ver Todos los Pedidos", admin_orders_path }
        # end #if si pedido terminado
    # end #each notify
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
