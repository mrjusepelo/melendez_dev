class Client < ActiveRecord::Base
  belongs_to :city
  # has_many :sales

  validates_presence_of :name
  validates_presence_of :document
  validates_presence_of :phone
  validates_presence_of :city
  validates_presence_of :neihborhood
  validates_presence_of :address








end
