require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "attributes" do
    it "has a username" do
      user = build(:user)
      expect(user).to respond_to(:username)
    end

    it "has an email" do
      user = build(:user)
      expect(user).to respond_to(:username)
    end
  end
end
