ActiveAdmin.register PaymentMode do
  menu :parent => "Creditos"

  controller do
        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end
end
