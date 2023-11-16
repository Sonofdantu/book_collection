class Attendance < ApplicationRecord
    validates_presence_of :email, :event_name
    validate :email_valid

    private
      def email_valid
        # Check if the email is present and ends with the expected domain
        if email.present? && !email.ends_with?('@tamu.edu', '@gmail.com')
          errors.add(:email, 'must be from tamu.edu or gmail.com domains.')
        end
      end
end
