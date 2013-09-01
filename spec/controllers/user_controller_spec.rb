require 'spec_helper'

describe UserController do

  describe '#create' do

    let(:user) { Fabricate.build(:user) }

    it 'is loggen in afterwards' do
      xhr :post, :create, user: { email: user.email, password: '123456' }
      session[:current_user_id].should be_present
    end

    it 'returns a positive feedback' do
      xhr :post, :create, user: { email: user.email, password: '123456' }
      ::JSON.parse(response.body)['success'].should be_true
    end

  end

end
