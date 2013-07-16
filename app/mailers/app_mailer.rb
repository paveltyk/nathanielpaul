class AppMailer < ActionMailer::Base
  def contact_form(contact, message)
    mail(
      :to => ENV['CONTACT_EMAIL'],
      :from => contact,
      :subject => 'New message from contact form',
      :body => message
      )
  end
end
