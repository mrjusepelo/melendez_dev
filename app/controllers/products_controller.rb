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



end
