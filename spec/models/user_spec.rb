require 'spec_helper'


describe User do

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  describe '#email' do

    let(:user) { Fabricate.build(:user) }

    %w(dot.fine@gmail.com mail@example.museum).each do |finemail|
      it { should allow_value(finemail).for(:email) }
    end

    %w(@gmail.com mail@ gmail.com).each do |badmail|
      it { should_not allow_value(badmail).for(:email) }
    end

    it 'is always used downcased' do
      user.email = 'DeVeLoPeR@Merkredo.Org'
      user.email.should eq 'developer@merkredo.org'
    end
  end

  describe '#password' do

    let(:user)  { Fabricate.build(:user) }

    before { user.password_required! }

    it 'is valid after initial save' do
      user.password = 'nyancat'
      user.save!
      user.confirm_password?('nyancat').should be_true
    end

    it 'is hashed after initial save' do
      user.password = 'roger1'
      user.save!
      user.password_hash.length.should eq 64
    end

    it 'needs more than 5 characters' do
      user.password = '12345'
      user.should_not be_valid
    end

  end

  context 'user creation' do
    let(:user) { Fabricate.build(:user) }

    it 'can be instantiated from params' do
      params = { email: 'developer@merkredo.com', password: 'secret' }
      user = User.new_from_params(params)
      user.email.should eq(params[:email])
    end
  end

end
