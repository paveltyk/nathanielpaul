module FeedbackSpecHelper
  def fill_form_with(email, subject, message)
    visit contact_path
    fill_in 'feedback[email]', :with => email
    fill_in 'feedback[subject]', :with => subject
    fill_in 'feedback[message]', :with => message
    click_button 'send message'
  end
end
