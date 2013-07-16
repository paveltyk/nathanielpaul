class AppMailer < ActionMailer::Base
  def deliver(contact, message)
    header = {
      :subject => 'New message from contact form',
      :from => contact,
      :to => ENV['CONTACT_EMAIL'],
      :body => message
    }
  end
end
