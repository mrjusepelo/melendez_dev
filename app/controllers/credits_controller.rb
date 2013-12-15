class CreditsController < ApplicationController

  respond_to :html, :json

  def autocomplete 
# a = Inventory.select(:id, :product_id).find(:all)
# (a).each do |pro|
#  puts pro.product.name
# end



    # @products = Product.autocomplete params[:term]
    @products = Inventory.where("lower(barcode) like ? AND state_inventory_id = 1", "%#{(params[:term]).downcase}%" ) 
    # @products = Inventory.where("lower(barcode) like ?", "%#{(params[:term]).downcase}%" ) AND :state_inventory_id = 1
    # WHERE (LOWER(persons.name) ILIKE 'jo%') AND active_person = 1
    # @products = Inventory.where(:state_inventory_id = 1 AND "lower(barcode) like ?", "%#{(params[:term]).downcase}%" )
    
    

    # @products = Product.where("lower(name) like ?", "%#{(params[:term]).downcase}%")

# @products = Product.where('id IN (SELECT product_id FROM inventories WHERE lower(name) like ?)', '%#{(params[:term]).downcase}%')
 # @products = Product.where('id IN (SELECT product_id FROM inventories ) AND lower(name) like ?', '%#{(params[:term]).downcase}%' )


# a = Inventory.select(:id, :product_id).find(:all)
# (a).each do |pro|
#     @products = pro.product.name
# end

    
    respond_with @products
  end

  def index
        html = render_to_string(:action => "index.html.erb")
    kit = PDFKit.new(html)
    send_data(kit.to_pdf, :filename => 'report.pdf', :type => 'application/pdf', :disposition => 'inline')
  end

  def admin_pdf
    
  end
  def show

  end
  

  def to_pdf
     @product = Product.find(id = params[:id])

    #  html = render_to_string(:action => "show.html.erb", :layout => true)
    # kit = PDFKit.new(html)
    # kit.stylesheets << 'vendor/assets/stylesheets/style.css'
    # # kit.stylesheets << 'app/assets/stylesheets/products.css.scss'
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
