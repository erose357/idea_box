require 'rails_helper'

RSpec.describe Idea do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:images) }
  end

  describe "attributes" do
    it "has a username" do
      idea = build(:idea)
      expect(idea).to respond_to(:title)
    end

    it "has a description" do
      idea = build(:idea)
      expect(idea).to respond_to(:description)
    end
  end
end
