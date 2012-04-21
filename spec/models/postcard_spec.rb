require 'spec_helper'

describe Postcard do
  it { should belong_to :sender }
  it { should belong_to :receiver}

  it "should return wrong state if send_date nor received_date is defined" do
    postcard = Postcard.new
    postcard.received_date.should be_nil
    postcard.send_date.should be_nil
    postcard.state.should == 'wrong'
  end

  it "should return completed state if received_date is defined" do
    postcard = Postcard.new
    postcard.received_date = Date.new
    postcard.state.should == 'completed'
  end

  it "should return sent state if send_date is defined and received_date is not" do
    postcard = Postcard.new
    postcard.received_date.should be_nil
    postcard.send_date = Date.new
    postcard.state.should == 'sent'
  end
end