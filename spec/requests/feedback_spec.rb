describe "Feedback page" do
    context 'get /contact' do
      before { get contact_path }

      it { response.status.should eq 200 }
    end

    context 'fill form with valid data' do
      before do
        visit contact_path
        fill_contact_form('user@example.com', 'Message text')
      end

      it { page.body.should have_content('Thank you for contacting us. We have received your message and will respond shortly.') }
      it { current_path.should be_eql contact_path }
    end

    context 'fill form with' do
      context 'all blank' do
        before do
          visit contact_path
          fill_contact_form('', '')
        end

        it { page.body.should have_selector('.feedback_email .help-inline', :text => "can't be blank") }
        it { page.body.should have_selector('.feedback_message .help-inline', :text => "can't be blank") }
      end

      context 'invalid email' do
        before do
         visit contact_path
         fill_contact_form('user@@example.com', 'Message text')
       end

        it { page.body.should have_selector('.feedback_email .help-inline', :text => "is invalid") }
      end
    end
end
