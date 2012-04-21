require 'spec_helper'

describe SessionsController do
  let(:user) { mock_model User }

  it 'should render view new if authentication failed' do
    User.should_receive(:find_by_name).and_return user
    user.should_receive(:authenticate).and_return false
    post :create
    response.should render_template :new
  end

  it 'should render view new if user not found' do
    User.should_receive(:find_by_name).and_return nil
    post :create
    response.should render_template :new
  end

  it 'should set user id in session and redirect to root_url if authentication passed' do
    User.should_receive(:find_by_name).and_return user
    user.should_receive(:authenticate).and_return true
    post :create
    session[:user_id].should == user.id
    response.should redirect_to root_url
  end

  it 'should clean up if user logs out' do
    session[:user_id] = user.id
    get :destroy
    session[:user_id].should be_nil
    response.should redirect_to root_url
  end
end