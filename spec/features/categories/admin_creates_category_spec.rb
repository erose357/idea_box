require 'rails_helper'

RSpec.describe "Admin creates category" do
  context "as an admin" do
    it "should be able to create a category" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      fill_in "category[name]", with: "Invention"

      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_css("h1", :text => "Categories Index")
      expect(page).to have_css("li", :text => "Invention")
    end
  end
end
