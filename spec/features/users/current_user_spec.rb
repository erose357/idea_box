require 'rails_helper'

RSpec.describe "User accesses show page" do
  context "current user" do
    it "is able to access show page" do
      user = create(:user)

      visit '/'

      click_on "User Login"

      fill_in "Username", with: "#{user.username}"
      fill_in "Password", with: "#{user.password}"
      click_on "Login"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}")
    end
  end

  context "guest" do
    it "is not able to access show page" do
      user = create_list(:user, 2)

      visit "/users/#{user[0].id}"

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
