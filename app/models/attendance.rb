class Attendance < ApplicationRecord
    validates :email, :event_name, presence: true
end
