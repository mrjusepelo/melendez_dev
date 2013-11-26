  ActiveAdmin.register_page "admin_pdf" do
<<<<<<< Updated upstream
     # @credit  = Credit.find(id = 12)
=======
    # @credit = Credit.find(id = 12)
>>>>>>> Stashed changes
    
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