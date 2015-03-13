require "rails_helper"
require "capybara/rails"

feature "Sign Up" do

  scenario "User can register at the signup route" do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Bill"
    fill_in "Last Name", with: "Murray"
    fill_in "Email", with: "bm@bm.com"
    fill_in "Password", with: "password"
    within ".form" do
      click_on "Log In"
    end

    expect(page).to have_content("Thanks for signing up for Rantly!")
  end

end
