class Member < ApplicationRecord
    validates_presence_of :totalPoints, :full_name, :position
    validates :email, presence: true, on: :create
    validates :totalPoints, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates_format_of :full_name, with: /\A[a-zA-Z\s-]+\z/
    validates_format_of :position, with: /\A[a-zA-Z\s-]+\z/
    validate :email_valid
    validates_format_of :phone_number, with: /\A\d+\z/

    private
      def email_valid
        # Check if the email is present and ends with the expected domain
        if email.present? && !email.ends_with?('@tamu.edu')
          errors.add(:email, 'must be from tamu.edu domain.')
        end
      end
end
