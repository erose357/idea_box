require 'rails_helper'

RSpec.describe "Logged in admin user" do
  context "adds a picture" do
    it "sees it on the picture index" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      click_on "New Image"

      fill_in "image[name]", with: "light bulb"
      fill_in "image[url]", with: "https://vignette2.wikia.nocookie.net/uncyclopedia/images/f/fb/Lightbulb_idea.jpg/revision/latest/scale-to-width-down/250?cb=20080819183356"

      click_on "Add Image"

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_css("li", :text => "light bulb")
      expect(page).to have_css("img", :count => 1)
    end
  end
end
