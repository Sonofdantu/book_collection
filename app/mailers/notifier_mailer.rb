class NotifierMailer < ApplicationMailer
    def new_account(recipient)
        attachments("attachment.pdf") = File.read("public/file.pdf")

        mail(
            to: recipient,
            subject: "Finnance Request Past Due Notification",
            #content_type: "text/html",
            #body: "<html><strong>Hello there</strong><html>"
        )
    end
end
