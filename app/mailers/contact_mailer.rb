class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: "historia.app.contact@gmail.com",
         subject: "【Historia】お問い合わせがありました")
  end
end
