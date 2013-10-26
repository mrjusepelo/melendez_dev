class PublicMailer < ActionMailer::Base
  default from: "creditos.melendez.ptyo@gmail.com"
  def send_email (name, phone, email, reason, messages)
    @name = name
    @phone = phone
    @email = email
    @reason = reason
    @messages = messages
    mail(to: "creditos.melendez.ptyo@gmail.com", subject: @reason)
  end
end