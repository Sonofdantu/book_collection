class Finance < ApplicationRecord
  enum status: { Pending: 0, Denied: 1, Approved: 2 }

  before_validation :set_default_status

  attr_accessor :current_member

  validates :email, presence: true
  validate :email_valid
  validates :eventTitle, presence: true
  validates :receipt, presence: true
  validates :description, presence: true
  validate :needs_reimbursement, unless: :is_finance_chair_or_president, on: :update
  validates :status, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }

  private

  def set_default_status
    self.status ||= :Pending
  end

  def email_valid
    # Check if the email is present and ends with the expected domain
    if email.present? && !email.ends_with?('@tamu.edu')
      errors.add(:email, 'must be from tamu.edu domain.')
    end
  end

  def is_finance_chair_or_president
    current_member&.position == 'President' || current_member&.position == 'Finance Chair'
  end

  def needs_reimbursement
    unless reimbursement.present? && status == "Approved"
      errors.add(:reimbursement, 'must be included and status must be set to Approved.')
    end
  end

end
  