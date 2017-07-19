require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "with valid attributes" do
    user_attributes = {username: "charliem",
                       password: "cmpassword",
                       email: "charliem@email.com"}

    visit new_user_path

    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[email]", with: user_attributes[:email]

    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful login")
  end
end
