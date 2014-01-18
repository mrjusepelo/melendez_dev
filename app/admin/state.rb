ActiveAdmin.register State do
  menu :parent => "Creditos"
  config.filters = false
  # filter :name

actions :all, :except => [:destroy, :edit]



  controller do
        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end
end
