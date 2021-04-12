require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe "associations" do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to have_secure_password }

    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    it { is_expected.to validate_length_of(:username).is_at_most(255) }

    it { is_expected.to allow_value("johndoe", "john123").for(:username) }

    it { is_expected.not_to allow_value("foo bar", "!foobar").for(:username) }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe "callbacks" do
    it "lowercases username before saving" do
      username = "hello"
      user.username = username.upcase
      user.save!

      expect(user.username).to eq(username)
    end

    it "strips the email before validation" do
      username = "   hello  "
      user.username = username
      user.save!

      expect(user.username).to eq("hello")
    end

    it "generates a new auth token" do
      user.auth_token = ""
      user.save!

      expect(user.auth_token).to be_present
    end
  end
end
