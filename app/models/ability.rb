class Ability
  include CanCan::Ability

  def initialize(admin_user)
    
    admin_user ||= AdminUser.new       
      case admin_user.role      
        when "super"
          # CANCAN Todo
          can :manage, :all
          can :manage, AdminUser
          can :manage, ActiveAdmin::Comment
        when "super-inscripciones"
          # CANCAN Users
          can :read, ActiveAdmin::Page, :name => "Dashboard" 
          can :manage, User
        when "Productos"
          can :read, ActiveAdmin::Page, :name => "Dashboard" 
          can :manage, Product  
        when "Ventas"
          can :read, ActiveAdmin::Page, :name => "Dashboard"
          can :manage, Sale
        # when "super-pedidos"
        #   # CANCAN Orders 
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-pagos"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-facturacion"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-despachos"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-cancelaciones"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "inscripciones"
        #   # CANCAN Users
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, User
        # when "pedidos-pagos-inscripciones"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-facturacion-inscripciones"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-despachos-inscripciones"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "pedidos-cancelaciones-inscripciones"
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Order
        # when "super-pedidos-inscripciones"
        #   # CANCAN Orders y Users
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, User 
        #   can :manage, Order 
        # when "super-pedidos-super-inscripciones"
        #   # CANCAN Orders y Users
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, User 
        #   can :manage, Order 
        # when "inventario"
        #   # CANCAN Productos, referencias, Colores, Tallas
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Product
        #   can :manage, Reference
        #   can :manage, Color
        #   can :manage, Size
        #   can :manage, ReferenceImage
        #   can :manage, Brand
        # when "coleccion"
        #   # CANCAN Catalogs, Collection, Pages
        #   can :read, ActiveAdmin::Page, :name => "Dashboard" 
        #   can :manage, Catalog  
        #   can :manage, Collection
        #   can :manage, Page
        # when "coleccion-inventario"
        #   # CANCAN Productos, referencias, Colores, Tallas, Catalogs, Collection, Pages
        #   can :read, ActiveAdmin::Page, :name => "Dashboard"
        #   can :manage, Product
        #   can :manage, Reference
        #   can :manage, Color
        #   can :manage, Size
        #   can :manage, ReferenceImage
        #   can :manage, Brand
        #   can :manage, Catalog  
        #   can :manage, Collection
        #   can :manage, Page
        # when "logistica"
        #   # CANCAN Productos, referencias, Colores, Tallas, Catalogs, Collection, Pages
        #   can :read, ActiveAdmin::Page, :name => "Dashboard"
        #   can :manage, City
        #   can :manage, Department
        #   can :manage, Transporter
        #   can :manage, PaymentType
      end
    end 
end
