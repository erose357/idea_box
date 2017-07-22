require 'rails_helper'

RSpec.describe "User deletes idea" do
  scenario "user can delete an idea" do
    user = create(:user_with_ideas)
    category = create(:category)
    idea = create(:idea, title: "pet rock", user: user, category: category)


    visit user_idea_path(user, idea)

    click_on "Delete"

    expect(current_path).to eq(user_path(user))
    expect(page).to_not have_content("pet rock")
  end
end
