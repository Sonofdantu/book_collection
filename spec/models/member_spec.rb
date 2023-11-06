require 'rails_helper'

RSpec.describe Member, type: :model  do
  # CREATE TESTING
  describe 'create_validations', :database => :truncation do
    it 'is valid with valid attributes' do
      member = Member.new(full_name: 'John Doe')
      expect(member).to be_valid
    end

   it 'is not valid with numbers in last name' do
      member = Member.new(full_name: 'John Doe27')
      expect(member).to_not be_valid
    end

   it 'is not valid with numbers in first name' do
      member = Member.new(full_name: 'John27 Doe')
      expect(member).to_not be_valid
    end

    it 'is not valid with symbols in last name' do
      member = Member.new(full_name: 'John Do&')
      expect(member).to_not be_valid
    end

    it 'is not valid with symbols in first name' do
      member = Member.new(full_name: 'John@ Doe')
      expect(member).to_not be_valid
    end
  end 

  describe 'update_validations', :database => :truncation do
    it 'is valid with valid attributes' do
      member = Member.new(totalPoints: 10, full_name: 'John Do', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer')
      expect(member).to be_valid
    end

    it 'is valid with hyphenated name' do
      member = Member.new(totalPoints: 10, full_name: 'Mary ann Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'Mary-ann Doe', position: 'Treasurer')
      expect(member).to be_valid
    end

    it 'is invalid with negative numbers for total points' do
      member = Member.new(totalPoints: 7, full_name: 'Mary-ann Doe', position: 'Treasurer')
      member.update(totalPoints: -7, full_name: 'Mary-ann Doe', position: 'Treasurer')
      expect(member).to_not be_valid
    end

    it 'is not valid without a name' do
      member = Member.new(totalPoints: 10, full_name: 'Joe Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: '', position: 'Treasurer')
      expect(member).to_not be_valid
    end

    it 'is not valid without position' do
      member = Member.new(totalPoints: 10, full_name: 'John Doe', position: 'GOAT')
      member.update(totalPoints: 10, full_name: 'John Doe', position: '')
      expect(member).to_not be_valid
    end

   it 'is not valid with numbers in name' do
      member = Member.new(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'John Doe27', position: 'Treasurer')
      expect(member).to_not be_valid
    end

    it 'is not valid with numbers in position' do
      member = Member.new(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer27')
      expect(member).to_not be_valid
    end

    it 'is not valid with symbols in name' do
      member = Member.new(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'John Doe%', position: 'Treasurer')
      expect(member).to_not be_valid
    end

    it 'is not valid with symbols in position' do
      member = Member.new(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer')
      member.update(totalPoints: 10, full_name: 'John Doe', position: 'Treasurer#')
      expect(member).to_not be_valid
    end
  end
end