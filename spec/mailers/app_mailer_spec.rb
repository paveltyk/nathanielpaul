require 'spec_helper'

describe AppMailer do
  context '#deliver' do
    let(:email) { AppMailer.contact_form('user@example.com', 'Sample message') }

    before { ENV['CONTACT_EMAIL'] = 'admin@site.com' }

    it { email.subject.should be_eql 'New Nathaniel Paul Inquiry' }
    it { email.from.should be_eql ['user@example.com'] }
    it { email.to.should be_eql ['admin@site.com'] }
    it { email.body.encoded.should be_eql 'Sample message' }
  end
end
