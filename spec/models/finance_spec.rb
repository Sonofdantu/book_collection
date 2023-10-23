require 'rails_helper'

RSpec.describe Finance, type: :model do
  describe 'finance creation validations' do
    it 'is valid with valid attributes' do
      finance = Finance.new(email: 'mrsnake@tamu.edu', eventTitle: 'General Meeting', cost: 20, receipt: 'text.png', reimbursement: 'text.png', resolved: true, description: 'General meeting with all members.')
      expect(finance).to be_valid
    end
    it 'is invalid with invalid cost attribute of negative number' do 
      finance = Finance.new(email: 'mrsnake@tamu.edu', eventTitle: 'General Meeting', cost: -10, receipt: 'text.png', reimbursement: 'text.png', resolved: true, description: 'General meeting with all members.')
      expect(finance).to_not be_valid
    end
    it 'is invalid with invalid cost attribute of a letter' do
      finance = Finance.new(email: 'mrsnake@tamu.edu', eventTitle: 'General Meeting', cost: 'a', receipt: 'text.png', reimbursement: 'text.png', resolved: true, description: 'General meeting with all members.')
      expect(finance).to_not be_valid
    end
  end
end
