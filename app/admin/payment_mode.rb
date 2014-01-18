ActiveAdmin.register PaymentMode do
  menu :parent => "Creditos"
  config.filters = false
actions :all, :except => [:destroy, :edit]

  controller do
        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end
end
