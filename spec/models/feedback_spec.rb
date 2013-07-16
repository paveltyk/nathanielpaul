require 'spec_helper'

describe Feedback do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:message) }

  describe :persisted? do
    let(:feedback) { Feedback.new }

    it { feedback.persisted?.should be_false }
  end

  describe :save do
    context 'with valid attributes' do
      let(:feedback) { Feedback.new :email => 'user@example.com', :message => 'Message text' }

      it { feedback.save.should be }
    end

    context 'with invalid attributes' do
      let(:feedback) { Feedback.new :email => 'user@example.com', :message => '' }

      it { feedback.save.should be_false }
    end
  end
end
