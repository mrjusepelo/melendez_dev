class PublicsController < ApplicationController
  def index
    @imagenes = Image.select(:id, :route).where(priority: 'true')

    # Images.where(priority: 'true').take
    # Client.where(first_name: 'Lifo').take
    # select(:id, :name, :amount).where("name like ?", "%#{search}%")

  end

  def show

  end

  def new

  end

  def create
  end

  def destroy
  end

  def update
  end
  
  def service
  end

  def folio
  end
  
  def blog
    if params[:search]
        @products = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{(params[:search]).downcase}%"])
  else
        @products = Product.find(:all)
    end
  end

  def contact
    @message = Message.new
  end
  def view_product
    @products = Product.find(id = params[:id_product])
    @images = Image.find_by product_id: @products.id
    @inventories = Inventory.find_by product_id: @products.id
    @brand = Brand.find(@products.brand_id)
    if defined?(@products)
      render "view_product"
    else
      render "blog"
    end
  end
  def create_message
#    @message = Message.create :name => params[:name], :phone => params[:phone], :email => params[:email], :reason => params[:reason], :message => params[:message]
    
#    if @message.save
#      render "contact", :notice => "Tu Mensaje se ha enviado"
#    else
#      render "contact"
#    end
#  end
    params.permit!
    @message = Message.new(params[:message])
    
    if @message.save
      redirect_to publics_contact_path, :notice => "Tu Mensaje se ha enviado"
    else
      render "contact"
    end
  end
end
