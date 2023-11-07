require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'check in validations' do
    it 'is valid with valid attributes' do
      attend = Attendance.new(email: 'jbob@tamu.edu', event_name: 'Billys Pizza Bash')
      expect(attend).to be_valid
    end
    it 'is invalid with no email' do 
      attend = Attendance.new(email: '', event_name: 'Billys Pizza Bash')
      expect(attend).to_not be_valid
    end
    it 'is invalid with no event name' do 
      attend = Attendance.new(email: 'jbob@tamu.edu', event_name: '')
      expect(attend).to_not be_valid
    end
  end
end