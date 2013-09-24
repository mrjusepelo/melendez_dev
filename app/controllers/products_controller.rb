class ProductsController < ApplicationController
  # def permitted_params
  #     params.permit product: [:name, :description]
  #   end

  respond_to :html, :json

  def autocomplete 
    @products = Product.autocomplete params[:term]
    
    respond_with @products
  end

  def index
    @products = Product.all

      @products = Product.search(params[:searchbox])
      respond_to do |format|
      format.html # index.html.erb
  end

  def search
    # where("name like ?", "%#{search}%")
    # Product.select(:id, :name, :amount).where("name like ?", "%#{search}%")
    end
  end
  def show
  end
  def new
  end
  def create
  end
  def update
  end
  def destroy
  end
  def view_product
    @products = Product.find(id = params[:id_product])
    @images = Image.find(product_id = @products.id)
    if defined?(@products)
      render "view_product"
    else
      render "blog"
    end
  end


end
