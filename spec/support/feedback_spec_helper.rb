module FeedbackSpecHelper
  def fill_contact_form(email, message)
    fill_in 'feedback[email]', :with => email
    fill_in 'feedback[message]', :with => message
    click_button 'send message'
  end
end
