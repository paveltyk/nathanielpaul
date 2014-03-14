class AppMailer < ActionMailer::Base
  def contact_form(contact, message)
    mail(
      :to => ENV['CONTACT_EMAIL'],
      :from => contact,
      :subject => 'New Nathaniel Paul Inquiry',
      :body => message
      )
  end
end
