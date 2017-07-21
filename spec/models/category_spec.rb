require 'rails_helper'

RSpec.describe Category do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "attributes" do
    it "has a name" do
      category = build(:category)

      expect(category).to respond_to(:name)
    end
  end
end
