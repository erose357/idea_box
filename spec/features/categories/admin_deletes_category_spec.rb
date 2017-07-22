require 'rails_helper'

RSpec.describe "Admin deletes category" do
  context "as an admin" do
    it "should be able to delete a category" do
      admin = create(:user, role: 1)
      categories = create_list(:category, 3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content(categories[0].name)
      expect(page).to have_css("li", :count => 3)
      expect(page).to have_link("Delete", :count => 3)

      click_on "Delete", :match => :first

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_css("li", :count => 2)
      expect(page).to_not have_content("#{categories[0].name} - Delete")
    end
  end
end
