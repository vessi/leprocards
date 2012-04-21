require 'spec_helper'

describe PostcardsHelper do
  describe "postcard status" do
    let(:postcard) { mock_model(Postcard) }

    it "should return span with success class if postcard.state is completed" do
      postcard.stub(:state).and_return('completed')
      postcard_status(postcard).should == '<span class="label label-success">completed</span>'
    end

    it "should return span with warning class if postcard.state is sent" do
      postcard.stub(:state).and_return('sent')
      postcard_status(postcard).should == '<span class="label label-warning">sent</span>'
    end

    it "should return span with important class if postcard.state is wrong" do
      postcard.stub(:state).and_return('wrong')
      postcard_status(postcard).should == '<span class="label label-important">wrong</span>'
    end
  end
end