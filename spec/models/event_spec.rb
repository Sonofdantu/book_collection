require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'event creation validation' do
    it 'is valid with valid attributes' do
      event = Event.new(title: 'Pizza Party', score: 10, password: 'p1zzaT1m3!', start_time: '2023-10-16 14:30:00', end_time: '2023-10-16 18:30:00')
      expect(event).to be_valid
    end
    it 'not valid with invalid score value' do
      event = Event.new(title: 'Pizza Party', score: -5, password: 'p1zzaT1m3!', start_time: '2023-10-16 14:30:00', end_time: '2023-10-16 18:30:00')
      expect(event).to_not be_valid
    end
    it 'is not valid with invalid score value' do
      event = Event.new(title: 'Pizza Party', score: 'aaaa', password: 'p1zzaT1m3!', start_time: '2023-10-16 14:30:00', end_time: '2023-10-16 18:30:00')
      expect(event).to_not be_valid
    end
  end
end
