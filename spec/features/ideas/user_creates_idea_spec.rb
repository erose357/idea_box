require 'rails_helper'

RSpec.describe "Logged in user" do
  context "creates a new idea" do
      it "it shows on user page" do

      user = create(:user)
      categories = create_list(:category, 3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}")

      click_on "New Idea"

      fill_in "idea[title]", with: "Jump to Conclusions Mat"
      fill_in "idea[description]", with: "You see, it would be this mat that You
                                          would put on the floor... and would have
                                          different conclusions written on it that
                                          you could jump to"
      page.select "#{categories[1].name}", :from => "idea[category_id]"

      click_on "Create Idea"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Jump to Conclusions Mat")
      expect(page).to have_content(user.username)
    end
  end
end
