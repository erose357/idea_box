require 'rails_helper'

RSpec.describe "User edits an idea" do
  scenario "a user can edit an idea" do
    user = create(:user_with_ideas)

    visit user_path(user)

    click_link "#{user.ideas[0].title}", :match => :first

    expect(current_path).to eq(user_idea_path(user.id, user.ideas[0].id))
    expect(page).to have_content(user.ideas[0].title)
    expect(page).to have_content(user.ideas[0].description)

    click_link "Edit"

    fill_in "idea[title]", with: "Updated Idea"

    click_on "Update Idea"
# save_and_open_page
    expect(current_path).to eq(user_idea_path(user, user.ideas[0].id))
    expect(page).to have_content("Updated Idea")
    expect(page).to_not have_content("Jump to Conclusions Mat")
  end
end
