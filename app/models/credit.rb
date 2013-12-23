class Credit < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :payment_mode
  belongs_to :state
  has_many :clients
  has_many :notification_credits

# lineas agregadas
  has_many :credit_products
  has_many :inventories, :through => :credit_products



  # has_many :credit_products
  has_many :payments_credits
  has_many :support_documents

  accepts_nested_attributes_for :clients
  accepts_nested_attributes_for :credit_products
  accepts_nested_attributes_for :payments_credits
  accepts_nested_attributes_for :support_documents

  # validates_presence_of :payday
  # # validates_presence_of :description
  # validates_presence_of :state_id
  # validates_presence_of :total
  # validates_presence_of :date
  # validates_presence_of :payment_mode_id
  # validates_presence_of :number_payments


  def self.autocomplete(search)
    # find(:all, :conditions => ['(name LIKE ? or id LIKE ?)', "%#{search}%",  "%#{search}%"], :limit => 20)
    # where("lower(name) like ?", "%#{(search).downcase}%")
    # where("id IN (SELECT product_id FROM inventories ) AND lower(name) like ?", "%#{(params[:term]).downcase}%" )
    # where("lower(name) like ? IN (SELECT product_id FROM inventories WHERE id = id)", "%#{(params[:term]).downcase}%" )
    # select(:id, :name, :amount).where("name like ?", "%#{search}% IN (SELECT product_id FROM inventories WHERE id == id)")
    # where('id IN (SELECT product_id FROM inventories WHERE lower(name) like ?)', '%#{(params[:term]).downcase}%')

    # select(:id, :name, :amount).where("name like ?", "%#{search}%")
  end


end
