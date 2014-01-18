class Order < ActiveRecord::Base
	has_many :order_products
	has_many :products, :through => :order_products



	has_many :consigments
	has_many :notifications
	belongs_to :supplier
	belongs_to :payment_mode
	belongs_to :state

   accepts_nested_attributes_for :order_products
   accepts_nested_attributes_for :consigments

  validates_presence_of :supplier
  validates_presence_of :payment_mode
  validates_presence_of :payday
  validates_presence_of :val_real
  validates_presence_of :number_payments
  validates_presence_of :value_payments

validates :val_real, :value_payments, :number_payments, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}

end

    # t.date     "date_billed"
    # t.date     "date_arrival"
    # t.date     "date_limit_pay"
    # t.date     "date_pay_real"
    # t.string   "val_real"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "supplier_id"
    # t.integer  "sum_payments"
    # t.integer  "payment_mode_id"
    # t.integer  "state_id"
    # t.integer  "number_payments"
    # t.integer  "value_payments"
    # t.date     "payday"
    # t.boolean  "published"
    # t.date     "nextpay"