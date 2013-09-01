require 'spec_helper'

describe SessionController do

  let (:user) { Fabricate(:user) }

  describe '#create' do

    it 'raises an error if not all params are present' do
      expect { xhr :post, :create }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises an error if only email parameter is present' do
      userJson = { email: 'fry@planet-express.com' }
      expect { xhr :post, :create, user: userJson }.to raise_error(ActionController::ParameterMissing)
    end


    context 'success' do

      before do
        xhr :post, :create, session: { email: user.email, password: '123456' }
        user.reload
      end

      it 'does not show a error' do
        ::JSON.parse(response.body)['error'].should_not be_present
      end

      it 'sets a session id' do
        session[:current_user_id].should eq(user.id)
      end

      it 'gives the user an auth_token' do
        cookies['_t'].should == user.auth_token
      end

      it 'returns the user object' do
        ::JSON.parse(response.body)['email'].should eq(user.email)
      end

    end

  end

end
