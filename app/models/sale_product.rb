class SaleProduct < ActiveRecord::Base
  belongs_to :sale
  belongs_to :inventory





  # validates_presence_of :product_id
  validates_presence_of :value
  validates_presence_of :amount
  validates_presence_of :unit_value
  # validates_presence_of :unit_value

validates :amount,  :unit_value, :value, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}



    # t.integer  "sale_id"
    # t.integer  "product_id"
    # t.integer  "value"
    # t.integer  "amount"
    # t.integer  "unit_value"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "inventory_id"
    # t.string   "inventory_fields"









end
