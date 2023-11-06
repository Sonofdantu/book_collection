class NotifierMailer < ApplicationMailer
    def new_account(recipient)
        attachments["attachment.pdf"] = File.read(public/file.pdf)

        mail(
            to: recipient,
            content_type: "text/html",
            body: "<html><strong>Hello there</strong></html>"
        )
    end 
end
