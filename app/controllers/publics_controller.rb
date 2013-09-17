class PublicsController < ApplicationController
  def index
    @imagenes = Image.select(:id, :route).where(priority: 'true')
    # @imagenes = Image.select(:id, :route).where(priority: 'true')
    

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
  end

  def contact
  end

end
