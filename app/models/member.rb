class Member < ApplicationRecord
    validates_presence_of :totalPoints, :full_name, :position
    validates :totalPoints, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates_format_of :full_name, with: /\A[a-zA-Z\s-]+\z/
    validates_format_of :position, with: /\A[a-zA-Z\s-]+\z/
end
