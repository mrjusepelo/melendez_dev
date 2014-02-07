  ActiveAdmin.register_page "Areportes" do

          # within @head do
          #      script :src => javascript_path('admin_credit.js'), :type => "text/javascript"
          #      script :src => javascript_path('6.js'), :type => "text/javascript"

          # end     

   # sidebar :help do  
   # 	div style: "width: 800px !important ;", :class => 'meta' do
   #      span "Post in "
   #    end
   #    ul do
   #      li "First Line of Help"
   #    end
   #  end

   #  content do
   #    para "Hello World"
   #  end
  

   #  action_item do
   #    link_to "Ver El sitio", "/"
   #  end



   #  page_action :ex, :method => :post do
   #    redirect_to admin_a_reportes_path, :notice => "Ejecutaste una Accion!!!"
   #  end

   #  action_item do
   #    link_to "Do Stuff", admin_a_reportes_ex_path, :method => :post
   #  end


  content do
    render :partial => 'products'
  end 






  end