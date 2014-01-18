class Client < ActiveRecord::Base
  belongs_to :city
  # has_many :sales

  validates_presence_of :name
  validates_presence_of :document
  validates_presence_of :phone
  validates_presence_of :city
  validates_presence_of :neihborhood
  validates_presence_of :address



# validates :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000000000, :message => "solo puedes ingresar n&uacute;meros enteros positivos"}






end
