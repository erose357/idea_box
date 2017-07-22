require 'rails_helper'

RSpec.describe "Logged in user" do
  context "visits their show" do
    it "should see their page" do
    user = create(:user_with_ideas)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_css("li", :count => 2)
    end
  end

  context "tries to visit another users page" do
    it "should see their own page not the other users" do
      user = create(:user_with_ideas)
      user_2 = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user_2)

      # expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_css("li", :count => 2)
    end
  end
end
