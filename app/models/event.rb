class Event < ApplicationRecord
    validates_presence_of :title, :score, :password, :start_time, :end_time
    validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
