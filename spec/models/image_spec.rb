require 'rails_helper'

RSpec.describe Image do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to have_many(:ideas) }
  end

  describe "attributes" do
    it "has a name" do
      image = create(:image)

      expect(image).to respond_to(:name)
    end

    it "has a url" do
      image = create(:image)

      expect(image).to respond_to(:url)
    end
  end
end
