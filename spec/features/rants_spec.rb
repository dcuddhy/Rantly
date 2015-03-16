require "rails_helper"
require "capybara/rails"


feature "User can only execute CRUD functions when logged in" do

  scenario "Non-user cannot create a new rant" do

    visit root_path
    click_on "New Rant"

    expect(page).to have_content("You must log in!")

  end

  scenario "User can create a rant" do
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

    click_on "New Rant"
    fill_in "Rant Title", with: "My New Rant"
    fill_in "Start your rant.", with: "My New Rant's body text.  It has to be more than one hundred and forty four characters so I'm writing quite a bit of text here.  Good Luck, dude."
    click_on "Save"

    expect(page).to have_content("Rant was successfully created.")

  end

  scenario "Non-user cannot seed edit button for rant" do

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

    click_on "New Rant"
    fill_in "Rant Title", with: "My New Rant"
    fill_in "Start your rant.", with: "My New Rant's body text.  It has to be more than one hundred and forty four characters so I'm writing quite a bit of text here.  Good Luck, dude."
    click_on "Save"

    expect(page).to have_content("Rant was successfully created.")
    click_on "Log Out"
    expect(page).to have_no_content("Murray")
    expect(page).to have_no_content("Edit")

  end



  scenario "User can edit a rant" do
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

    click_on "New Rant"
    fill_in "Rant Title", with: "My New Rant"
    fill_in "Start your rant.", with: "My New Rant's body text.  It has to be more than one hundred and forty four characters so I'm writing quite a bit of text here.  Good Luck, dude."
    click_on "Save"

    expect(page).to have_content("Rant was successfully created.")

    click_on "Edit"
    fill_in "rant_title", with: "I Edited My New Rant"
    fill_in "rant_body", with: "I Edited My New Rant's body text.  It has to be more than one hundred and forty four characters so I'm writing quite a bit of text here.  Good Luck, dude."
    click_on "Save"

    expect(page).to have_content("Rant was successfully edited.")

  end

  scenario "User can delete a rant" do
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

    click_on "New Rant"
    fill_in "Rant Title", with: "My New Rant"
    fill_in "Start your rant.", with: "My New Rant's body text.  It has to be more than one hundred and forty four characters so I'm writing quite a bit of text here.  Good Luck, dude."
    click_on "Save"

    expect(page).to have_content("Rant was successfully created.")

    click_on "Edit"
    click_on "Delete"

    expect(page).to have_content("Rant was successfully destroyed.")

  end


end
