require 'spec_helper'

describe ApplicationController do
  context '#current_user' do
    controller do
      def index
        current_user
        render nothing: true
      end
    end

    let(:user) { mock_model(User) }

    it 'should return current user if user in session is set' do
      session[:user_id] = 1
      User.should_receive(:find).with(1).and_return(user)
      get :index
      assigns(:current_user).should == user
    end

    it 'should not set current_user if user in session is not set' do
      get :index
      assigns(:current_user).should be_nil
    end
  end

  context '#authorize' do
    controller do
      before_filter :authorize
      def index
        render nothing: true
      end
    end

    let(:user) { mock_model(User) }

    it 'should not redirect if current_user is set' do
      controller.should_receive(:current_user).and_return user
      get :index
      response.should_not redirect_to login_url
    end

    it 'should redirect to login_url if current_user is not set' do
      controller.should_receive(:current_user).and_return nil
      get :index
      response.should redirect_to login_url
    end

  end

end