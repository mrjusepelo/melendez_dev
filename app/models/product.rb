class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :image
  has_many :product_categories
  has_many :categories, :through => :product_categories  

  # def self.autocomplete(search)
    

    # find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%#{search}%",  "%#{search}%"], :limit => 20)
  	# Product.find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%pro%"])
    # --Funcional --Product.find(:all, :conditions => ['name LIKE ?', "%pro%"]) 
    # --Funcional --Product.find(:first, :conditions => ['name LIKE ?', "%pro%"]) 
    # --Funcional --Product.find(:first, :conditions => ['name LIKE ?', "%pro%"]).amount
    # --Funcional --Product.find_by(name: "producto1")
    # --Funcional --Product.select(:name, :amount).find(1)
    # where("name like ?", "%#{search}%")
    

    # select(:name, :amount).where("name like ?", "%pro%")
  	

    # where("name like ?", "%pro%")
    # Product.find(2).amount ----Funcional
  	# Product.where("name like ?", "%#{params[:query]}%").to_sql
  	# Client.where("first_name LIKE '%#{params[:first_name]}%'")
  	# where(name: search)
  # end

end
