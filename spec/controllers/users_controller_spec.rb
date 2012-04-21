require 'spec_helper'

describe UsersController do
  let(:user) { mock_model User }
  it 'should create new user' do
    User.should_receive(:new).and_return user
    get :new
    assigns(:user).should == user
  end

  it 'should render view new if user creation failed' do
    User.should_receive(:new).and_return user
    user.should_receive(:save).and_return false
    post :create
    response.should render_template :new
  end

  it 'should set session user_id and redirect to root_url if user creation passed' do
    User.should_receive(:new).and_return user
    user.should_receive(:save).and_return true
    post :create
    session[:user_id].should == user.id
    response.should redirect_to root_url
  end
end