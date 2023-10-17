class Attendance < ApplicationRecord
  validates_presence_of :email, :event_name
end
