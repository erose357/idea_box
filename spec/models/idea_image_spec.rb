require 'rails_helper'

RSpec.describe IdeaImage do
  describe "validations" do
    it { is_expected.to belong_to(:idea) }
    it { is_expected.to belong_to(:image) }
  end
end
