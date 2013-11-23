class CreditsController < ApplicationController
  def index
  end

  def admin_pdf
    
  end
  def show
        @imagenes = Image.select(:id, :route).where(priority: 'true')
    @categories = Category.all
     @credit = Credit.find(id = params[:id])

    
     html = render_to_string(:action => "show.html.erb", :layout => true)
    kit = PDFKit.new(html)
    kit.stylesheets << 'vendor/assets/stylesheets/style.css'
    # kit.stylesheets << 'app/assets/stylesheets/products.css.scss'
    send_data(kit.to_pdf, :filename => 'test_report_credito.pdf', :type => 'application/pdf')
  end
  

  def to_pdf
     @product = Product.find(id = params[:id])

     # html = render_to_string(:action => "show.html.erb", :layout => true)
    # kit = PDFKit.new(html)
    # kit.stylesheets << 'vendor/assets/stylesheets/style.css'
    # kit.stylesheets << 'app/assets/stylesheets/products.css.scss'
    # send_data(kit.to_pdf, :filename => 'test_report_with_table.pdf', :type => 'application/pdf')
  end

  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end

  
end
