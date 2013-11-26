  ActiveAdmin.register_page "admin_pdf" do
     # @credit  = Credit.find(id = 12)
    # @credit = Credit.find(id = 12)
    
    content do
      para "Hello World"
      @credit.id
    end


controller do
        before_filter :protected_attributes
        def protected_attributes
          params.permit!
        end
  end    
  end