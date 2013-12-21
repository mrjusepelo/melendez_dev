ActiveAdmin.register_page "Dashboard" do
# menu false
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end



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


h3 section "Notificaciones de Pedidos Proximos a Pagar" do
         # @ultimoPago = Notification.where(nextdate: Date.today)
    
    # notificaciones pasadas sin ser revizadas
     # @pasadas = Notification.where("nextdate < ? AND revised = 'false'", Date.today)

    table_for Notification.where("nextdate < ? AND revised = 'false'", Date.today).limit(5) do |t| 
         # table_for current_admin_user.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|   
    # table_for Product.brand.limit(5) do
    t.column "Proveedor" do |prov|
        link_to prov.order.supplier.name, admin_order_path(prov)
    end 
    t.column "Notificacion" do |noti|
        link_to noti.id, admin_order_notifications_path(noti.order.id)
        # admin_credit_payments_credits_path(credit)
    end     
    t.column :created_at 
# t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
    end
    strong { link_to "Ver Todos los Pedidos", admin_orders_path }
end



h3 section "Notificacion de Pagos para Hoy" do

    table_for Notification.where(nextdate: Date.today).limit(5) do |t| 
        t.column "Proveedor" do |prov|
            link_to prov.order.supplier.name, admin_order_path(prov)
        end 
        t.column "Notificacion" do |noti|
            link_to noti.id, admin_order_notifications_path(noti.order.id)
        end     
        t.column :created_at 
        end
    strong { link_to "Ver Todos los Pedidos", admin_orders_path }
end








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
