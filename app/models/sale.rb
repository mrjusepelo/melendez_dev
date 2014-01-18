class Sale < ActiveRecord::Base
  belongs_to :credit
  belongs_to :admin_user


  has_many :sale_products
  has_many :inventories, :through => :sale_products, dependent: :destroy

  has_many :pay_sales



  has_many :pay_efectives, dependent: :destroy
  has_many :pay_consigments, dependent: :destroy
  # has_many :pay_sales, :through => :pay_consigments
    has_many :clients, dependent: :destroy


  accepts_nested_attributes_for :sale_products
  accepts_nested_attributes_for :clients
  # accepts_nested_attributes_for :pay_sales

  accepts_nested_attributes_for :pay_efectives
  accepts_nested_attributes_for :pay_consigments





  # before_destroy :cleanup

  # private
  # def cleanup
  #   # if self.is_fired?
  #     # puts "************Id del inventory******************** "+self.id.to_s
  #     # # puts "************Id del inventory******************** "

  #       self.sale_products.each do |pro_inventory|
  #     #     puts "***********pro_inventory**********"+pro_inventory.inventory.id.to_s
  #     #     puts "***********pro_inventory**********"+pro_inventory.inventory.to_s
          
  #     #     inventory = Inventory.find(pro_inventory.inventory.id)
  #     #     #disponible el producto en el inventario
  #     #     inventory.update_attribute(:state_inventory_id, 1) 

  #          Inventory.update(pro_inventory.inventory.id, :state_inventory_id => 1)
  #          # Inventory.update(29, :state_inventory_id => 1)
  #       end

  #     # self.coworkers.destroy_all
  #     # self.company_credit_cards.destroy_all
  #   # end
  # end







end
