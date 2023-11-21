class OfficerEntry < ApplicationRecord  
  validates_presence_of :points, :email
  validates_presence_of :description, message: "Description cannot be blank."
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end