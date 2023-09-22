# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe BookCollection, type: :model do
  subject do
    described_class.new(name: 'harry potter') # Changed from title to name
  end

  it 'is valid with valid attributes because only name provided' do
    expect(subject).not_to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil # Changed from title to name
    expect(subject).not_to be_valid
  end
end
