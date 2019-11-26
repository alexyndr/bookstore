require 'rails_helper'

RSpec.feature "Mainpages", type: :feature do
  feature "when the main page is accessed" do
    background do
      visit "/"
    end
    scenario "display the index.html page" do
      expect(page).to have_content("Welcome")
    end
    scenario "index page has bootstrap styles" do
      expect(page).to have_css("div.container")
    end
  end
end
