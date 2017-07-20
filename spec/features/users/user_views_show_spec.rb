require 'rails_helper'

RSpec.describe "User visits show page" do
  context "as logged in user" do
    it "should display show page" do
      user = create(:user)

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}")
    end
  end
end
