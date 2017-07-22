require 'rails_helper'

RSpec.describe "User visits show page" do
  context "as logged in user" do
    it "should display show page" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Welcome, #{user.username}")
    end
  end
end
