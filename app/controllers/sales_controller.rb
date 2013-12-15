class SalesController < ApplicationController

  respond_to :html, :json

  def autocomplete 
# a = Inventory.select(:id, :product_id).find(:all)
# (a).each do |pro|
#  puts pro.product.name
# end



    # @products = Product.autocomplete params[:term]
    # @products = Product.where("lower(name) like ?", "%#{(params[:term]).downcase}%")
    
    @products = Inventory.where("lower(barcode) like ? AND state_inventory_id = 1", "%#{(params[:term]).downcase}%" ) 
    # @products = Inventory.where("lower(barcode) like ?", "%#{(params[:term]).downcase}%")
    
    # @products = Inventory.select(:id, :barcode, :serial).where("lower(barcode) like ?", "%#{(params[:term]).downcase}%")
    # @products = Inventory.select(:id, :serial).where("lower(barcode) like ?", "%1386048020%")
                # Inventory.select(:id, :serial).where(barcode: '13860480203')
    
    

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
  end

  def view
  end

  def edit
  end

  def show
  end

  def create
  end

  def delete
  end
end
