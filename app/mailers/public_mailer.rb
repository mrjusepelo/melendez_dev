class PublicMailer < ActionMailer::Base
  default from: "sebasnba14@gmail.com"
  def send_email (name, phone, email, reason, messages)
    @name = name
    @phone = phone
    @email = email
    @reason = reason
    @messages = messages
    # mail(to: "creditos.melendez.ptyo@gmail.com, creditosmelendezq@hotmail.com", subject: @reason)
    mail(to: "jperezlondono@gmail.com", subject: @reason)
  end
end