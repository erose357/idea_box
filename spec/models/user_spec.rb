require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to have_many(:ideas) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email) }
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

  it "can be created as an admin" do
    user = create(:user, role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = create(:user)

    expect(user.role).to eq("user")
    expect(user.user?).to be_truthy
    expect(user.admin?).to be_falsey
  end
end
