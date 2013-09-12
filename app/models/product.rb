class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :images
  has_many :product_categories
  has_many :categories, :through => :product_categories  

   accepts_nested_attributes_for :images

 # validates_each :name, :surname do |model, attr, value|
 #    model.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
 #  end


  def self.autocomplete(search)
    # find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%#{search}%",  "%#{search}%"], :limit => 20)
    where("name like ?", "%#{search}%")
    # select(:id, :name, :amount).where("name like ?", "%#{search}%")
  end

  # mount_uploader :image, UserImageUploader
  
  # after_update :crop_attachment
  
  # def crop_attachment 
  #   self.image.recreate_versions! if crop_x.present? 
  # end

end