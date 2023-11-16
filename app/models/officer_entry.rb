class OfficerEntry < ApplicationRecord
    def new
        @officer_entry = OfficerEntry.new
        @officer_emails = Member.where.not(position: ['Member', 'Pending']).pluck(:email)
    end      
    validates_presence_of :points, :email, :description
    validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validate email_valid

    private
      def email_valid
        # Check if the email is present and ends with the expected domain
        if email.present? && !email.ends_with?('@tamu.edu', '@gmail.com')
          errors.add(:email, 'must be from tamu.edu or gmail.com domains.')
        end
      end
end
