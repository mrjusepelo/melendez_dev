ActiveAdmin.register AdminUser do
  # admin.build_menu do |menu|
  #   menu.add :label => 'Custom Menu' do |submenu|
  #     submenu.add :label => 'Custom Link', :url => custom_path
  #   end
  # end

  index do
    column :name
    column :email
    column :document
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email
  filter :name

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :document
      f.input :password
      f.input :password_confirmation
      f.input :role, :as => :select, :include_blank => false, :collection => [["Selecciona", nil], ["Secretario", "secretario"], ["Vendedor", "vendedor"]]
      # f.input :role, :as => :select, :include_blank => false, :collection => [["Selecciona", nil], ["Super", "Super"], ["Super Lectura", "Super Lectura"], ["Pedidos", "Pedidos"], ["Productos", "Productos"]]
      # f.input :role, :as => :select, :collection => {"Super" => "1", "Productos" => "2"}
      # f.input :role, :as => :string















    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit admin_user: [:name, :email, :document, :password, :password_confirmation, :role]
    end
  end
end
