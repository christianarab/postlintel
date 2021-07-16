class EventMailer < ApplicationMailer
  def event_email
    @user = User.find(1)
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'New event created', template_path: 'event_mailer', template_name: 'event_mailer')
  end
end