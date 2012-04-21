require 'spec_helper'

describe PostcardsController do

  let(:user) { mock_model User }

  it 'should set @postcards by current_user receiver id' do
    controller.stub(:current_user).and_return(user)
    Postcard.should_receive(:find_all_by_receiver_id).with(user.id).and_return []
    get :received_cards
    assigns(:postcards).should == []
  end
end