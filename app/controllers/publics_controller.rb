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
        @products = Product.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
        @products = Product.find(:all)
    end
  end

  def contact
  end
  def view_product
    @products = Product.find(id = params[:id_product])
    @images = Image.find_by product_id: @products.id
    @inventories = Inventory.find_by product_id: @products.id
    if defined?(@products)
      render "view_product"
    else
      render "blog"
    end
  end
end
