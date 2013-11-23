class Product < ActiveRecord::Base
  

# Lineas agregadas
  has_many :credit_products
  has_many :credits, :through => :credit_products






  belongs_to :brand
  has_many :images
  has_many :product_categories
  has_many :categories, :through => :product_categories  
  has_many :order_products
  

  # has_many :inventories

  validates_presence_of :brand

   accepts_nested_attributes_for :images



  # def self.search(search)
  #   if search
  #         find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #       find(:all)
  #   end
  # end


  def self.autocomplete(search)
    # find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%#{search}%",  "%#{search}%"], :limit => 20)
    where("lower(name) like ?", "%#{(search).downcase}%")
    # select(:id, :name, :amount).where("name like ?", "%#{search}%")
  end

  # mount_uploader :image, UserImageUploader
  
  # after_update :crop_attachment
  
  # def crop_attachment 
  #   self.image.recreate_versions! if crop_x.present? 
  # end


    # --Funcional --Product.select(:id, :name, :amount).where("name like ?", "%prod%")



    # find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%#{search}%",  "%#{search}%"], :limit => 20)
    # Product.find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%pro%"])
    # --Funcional --Product.find(:all, :conditions => ['name LIKE ?', "%pro%"]) 
    # --Funcional --Product.find(:first, :conditions => ['name LIKE ?', "%pro%"]) 
    # --Funcional --Product.find(:first, :conditions => ['name LIKE ?', "%pro%"]).amount
    # --Funcional --Product.find_by(name: "producto1")
    # --Funcional --Product.select(:name, :amount).find(1)
    # where("name like ?", "%#{search}%")
    

    # where("name like ?", "%pro%")
    # Product.find(2).amount ----Funcional
    # Product.where("name like ?", "%#{params[:query]}%").to_sql
    # Client.where("first_name LIKE '%#{params[:first_name]}%'")
    # where(name: search)









    
end