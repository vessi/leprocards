require 'spec_helper'

describe ApplicationController do

  it 'should return current user if user in session is set' do
    user = mock_model(User)
    User.should_receive(:find).and_return(user)
    session[:user_id] = 1
    controller.send(:current_user)
    assigns(:current_user).should_not be_nil
  end

  it 'should not redirect if current_user is set' do
    user = mock_model(User)
    controller.stub(:current_user).and_return user
    controller.send(:authorize)
    response.should_not redirect_to login_url
  end

  it 'should redirect to login_url if current_user is not set' do
    pending 'Not discovered how to test redirection in ApplicationController yet'
  end
end