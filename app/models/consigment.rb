class Consigment < ActiveRecord::Base
  belongs_to :order

  validates_numericality_of :value, :only_integer =>true, :greater_than_or_equal_to =>0, :message => "invalid fundays"
# validates :your_field, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
  # validates :points, numericality: true
  # validates :games_played, numericality: { only_integer: true 
  # validates_numericality_of :foo, :integer_only => true, :gt => 0


# probar este
# validates_numericality_of :a, :only_integer => true, :allow_nil => true, 
#     :greater_than_or_equal_to => 1,
#     :less_than_or_equal_to => 999,
#     :message => "can only be whole number between 1 and 999."


end
