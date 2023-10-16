class OfficerEntry < ApplicationRecord
    def new
        @officer_entry = OfficerEntry.new
        @officer_emails = Member.where.not(position: 'Member').pluck(:email)
    end      
end
