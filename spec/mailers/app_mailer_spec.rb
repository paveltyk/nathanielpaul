require 'spec_helper'

describe AppMailer do
  context '#deliver' do
    let(:email) { AppMailer.deliver('user@example.com', 'Sample message') }

    it { email.subject.should be_eql 'New message from contact form' }
    it { email.from.should be_eql 'user@example.com' }
    it { email.to.should be_eql ENV['CONTACT_EMAIL'] }
    it { email.body.should be_eql 'Sample message'  }
  end
end
