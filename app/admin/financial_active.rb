ActiveAdmin.register FinancialActive do

  actions :all, :except => [:destroy]

  menu :parent => "Balance General"


  form do |f|
    f.inputs "Estados Activos" do
      f.input :name, :input_html => {:style => "width: 460px;"} 
      f.input :value, :input_html => {:style => "background-color: #E6E6E6; width: 260px;"} 
      f.input :date, as: :datepicker, :input_html => {:style => "background-color: #E6E6E6; width: 60px;", :value => Date.today} 
      f.input :resource_type, :input_html => {:style => "width: 460px;"} 

    end
    f.actions
  end




controller do
      before_filter :protected_attributes
      def protected_attributes
        params.permit!
      end
  end	
end
