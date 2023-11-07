class Finance < ApplicationRecord
    validates_presence_of :email, :eventTitle, :cost, :receipt, :description
    validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
  