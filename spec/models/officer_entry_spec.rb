require 'rails_helper'

RSpec.describe OfficerEntry, type: :model do
  describe 'officer entry validations' do
    it 'is valid with valid attributes' do
      offEnt = OfficerEntry.new(points: 5, email: 'frogger69@tamu.edu', description: 'Super awesome fun event yeah')
      expect(offEnt).to be_valid
    end
    it 'is invalid with invalid points value of a negative number' do
      offEnt = OfficerEntry.new(points: -5, email: 'frogger69@tamu.edu', description: 'Super awesome fun event yeah')
      expect(offEnt).to_not be_valid
    end
    it 'is invalid with invalid points value of a letter' do
      offEnt = OfficerEntry.new(points: 'a', email: 'frogger69@tamu.edu', description: 'Super awesome fun event yeah')
      expect(offEnt).to_not be_valid
    end
  end
end
