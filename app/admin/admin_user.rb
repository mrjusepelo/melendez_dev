ActiveAdmin.register AdminUser do
  index do
    column :name
    column :email
    column :document
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
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit admin_user: [:name, :email, :document, :password, :password_confirmation]
    end
  end
end
