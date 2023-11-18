class OfficerEntry < ApplicationRecord
  def new
      @officer_entry = OfficerEntry.new
      @officer_emails = Member.where.not(position: ['Member', 'Pending']).pluck(:email)
  end      
  validates_presence_of :points, :email, :description
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
