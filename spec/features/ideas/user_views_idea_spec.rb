require 'rails_helper'

RSpec.describe "User views one idea" do
  scenario "user see view page for that idea" do
    user = create(:user_with_ideas)

    visit user_path(user)

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.username}")

    click_link "#{user.ideas[0].title}"

    expect(current_path).to eq(user_idea_path(user.id, user.ideas[0].id))
    expect(page).to have_css("h1", :text => "Jump to Conclusions Mat")
    expect(page).to have_css("p", :text => "It has conclusions")
  end
end
