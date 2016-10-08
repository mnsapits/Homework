require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "jonathan",
      password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "finds user" do
      expect(User.find_by_credentials(user.username, user.password)).to eq(user)
    end

    it "returns nil" do
      expect(User.find_by_credentials("jonathan", "bad_password")).to eq(nil)
    end
  end
end
