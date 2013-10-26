class PublicsController < ApplicationController
  def index
    @imagenes = Image.select(:id, :route).where(priority: 'true')
    @categories = Category.all
    # Images.where(priority: 'true').take
    # Client.where(first_name: 'Lifo').take
    # select(:id, :name, :amount).where("name like ?", "%#{search}%")

  end

  def show
    @categories = Category.all
  end

  def new
    @categories = Category.all
  end

  def create
    @categories = Category.all
  end

  def destroy
    @categories = Category.all
  end

  def update
    @categories = Category.all
  end
  
  def service
    @categories = Category.all
  end

  def folio
    @categories = Category.all
  end
  
  def product
    @categories = Category.all
    if params[:search]
        @products = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{(params[:search]).downcase}%"])
  else
        @products = Product.find(:all)
    end
  end

  def contact
    @categories = Category.all
    #@message = Message.new
  end
  def view_product
    @categories = Category.all
    @products = Product.find(id = params[:id_product])
    @images = Image.find(:all, :conditions => { :product_id => @products.id })
    @inventories = Inventory.find_by product_id: @products.id
    @brand = Brand.find(@products.brand_id)
    if defined?(@products)
      render "view_product"
    else
      render "blog"
    end
  end
  def create_message
  
   PublicMailer.send_email(params[:name], params[:phone], params[:email], params[:reason], params[:message]).deliver
   # params.permit!
   # @message = Message.new(params[:message])
    
   # if @message.save
      redirect_to publics_contact_path, :notice => "Tu Mensaje se ha enviado"
   # else
   #   render "contact"
   # end
  end
  def category
    @Product_category = ProductCategory.find(:all, :conditions => { :category_id => params[:id_category]})
    @category = Category.find(id = params[:id_category])
    @categories = Category.all
  end
end
