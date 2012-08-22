class ContactMailer < ActionMailer::Base
  def email_peter(email, name, body)
    @name = name
    @email = name
    @body = body
    mail(
      :from => @email,
      :to => "Peter Kennedy <peter.kennedy@ven.io>", 
      :subject => "Inquiries! - " + @name
    ).deliver
  end
end
