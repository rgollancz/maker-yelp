require 'rails_helper'

RSpec.describe "restaurants/all.html.erb", type: :view do

  describe "listing all restaurants" do
    scenario "I can list all saved restaurants" do
      create_user
      add_restaurant
      submit_review
      expect(page).to have_content("Dishoom")
      expect(page).to have_content("tasty indian food")
      expect(page).to have_content("old street")
      expect(page).to have_content("😋😋😋😋")
      expect(page).to have_content("great food, big queue")
    end
  end
end
