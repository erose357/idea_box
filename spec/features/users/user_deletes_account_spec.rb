require 'rails_helper'

RSpec.feature "User deletes account" do
  scenario "user is able to delete account" do
    user = create(:user)

    visit user_path(user)

    click_on "User Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password

    click_on "Login"

    click_on "Delete Account"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Welcome, #{user.username}")
  end
end
