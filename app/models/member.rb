class Member < ApplicationRecord
    validates_presence_of :totalPoints, :full_name, :position
    validates :totalPoints, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates_format_of :full_name, with: /\A[a-zA-Z\s-]+\z/
    validates_format_of :position, with: /\A[a-zA-Z\s-]+\z/
    validate :email_valid

    private
      def email_valid
        # Check if the email is present and ends with the expected domain
        if email.present? && !email.ends_with?('@tamu.edu', '@gmail.com')
          errors.add(:email, 'must be from tamu.edu or gmail.com domains.')
        end
      end
end
