class Finance < ApplicationRecord
  validates_presence_of :email, :eventTitle, :cost, :receipt, :description
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  enum status: { Pending: 0, Denied: 1, Approved: 2 }

  before_create :set_default_status

  private

  def set_default_status
    self.status ||= :Pending
  end
end
  