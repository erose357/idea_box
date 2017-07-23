require 'rails_helper'

RSpec.describe "Logged in user" do
  context "adds an image to an idea" do
    it "shows on the user show page" do
      user = create(:user_with_ideas)
      image = create(:image)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_link "#{user.ideas[0].title}"

      click_on "Edit"

      check "#{image.name}"

      click_on "Update Idea"

      expect(current_path).to eq(user_idea_path(user.id, user.ideas[0].id))
      expect(page).to have_css("img")
    end
  end
end
