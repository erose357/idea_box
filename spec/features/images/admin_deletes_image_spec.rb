require 'rails_helper'

RSpec.describe "Logged in admin user" do
  context "deletes an image" do
    it "is no longer on the index page" do
      admin = create(:user, role: 1)
      image = create(:image)
      images = create_list(:image, 3)


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      click_on "Delete", :match => :first

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_css("li", :text => "#{images[1].name}")
      expect(page).to_not have_css("li", :text => "#{image.name}")
      expect(page).to have_content("#{image.name} deleted")
    end
  end
end
