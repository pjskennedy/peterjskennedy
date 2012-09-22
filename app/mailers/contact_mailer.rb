class ContactMailer < ActionMailer::Base
  def email_peter(email, name, body)
    @name = name
    @email = email
    @body = body
    mail(
      :from => @email,
      :to => "Peter Kennedy <peterjskennedy@gmail.com>", 
      :subject => "Inquiries! - " + @name
    ).deliver
  end
end
