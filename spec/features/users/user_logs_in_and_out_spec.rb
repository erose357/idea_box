require 'rails_helper'

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {username: "charliem",
                       password: "cmpassword",
                       email: "charliem@email.com"}

    user = User.create(user_attributes)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user_attributes[:password]

    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful login")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("Goodbye")
  end

  scenario "logs in without valid credentials" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: "pw"

    click_on "Login"
  
    expect(current_path).to eq(login_path)
    expect(page).to have_css("nav", :text => "Invalid Credentials")
  end
end
