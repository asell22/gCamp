require 'rails_helper'

feature "Users" do

  scenario "User creates a user" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "user_first_name", with: "Alex"
    fill_in "user_last_name", with: "Sell"
    fill_in "user_email", with: "asell@comcast.net"
    click_on "Create User"

    expect(page).to have_content("Alex Sell")
    expect(page).to have_content("asell@comcast.net")
  end

  scenario "User edits a user" do

    User.create!(
            first_name: "Alex",
            last_name: "Sell",
            email: "asell@comcast.net"
        )

        visit root_path
        click_on "Users"
        click_on "edit-user-action"
        fill_in "user_first_name", with: "Al"
        fill_in "user_last_name", with: "Pacino"
        fill_in "user_email", with: "alexanderjsell@gmail.com"
        click_on "Update User"

        expect(page).to have_content("Al Pacino")
        expect(page).to have_content("alexanderjsell@gmail.com")
  end

  scenario "User edits a user" do

    User.create!(
            first_name: "Alex",
            last_name: "Sell",
            email: "asell@comcast.net"
        )

        visit root_path
        click_on "Users"
        click_on "edit-user-action"
        click_on "delete-user-action"

        expect(page).to have_no_content("Alex Sell")
        expect(page).to have_no_content("asell@comcast.net")
    end    



end


#
# feature "Events" do
#
#   scenario "User edits an event" do
#     Event.create!(
#       description: "My aweeesome event"
#     )
#
#     visit root_path
#     expect(page).to have_content("My aweeesome event")
#     click_on "edit"
#     fill_in "Description", with: "My awesome event"
#     click_on "Update Event"
#
#     expect(page).to have_content("My awesome event")
#     expect(page).to have_no_content("My aweeesome event")
#   end
#
# end
