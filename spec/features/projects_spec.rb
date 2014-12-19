require 'rails_helper'

  feature "Projects" do
    scenario "User creates a project" do

      visit root_path
      click_on "Projects"
      click_on "New Project"
      fill_in "project_name", with: "created project"
      click_on "Create Project"

      expect(page).to have_content("created project")
    end

    scenario "User edits a project" do

      Project.create!(
      name: "edit me"
      )
      visit root_path
      click_on "Projects"
      click_on "edit me"
      click_on "edit-project-action"
      fill_in "project_name", with: "I am edited"
      click_on "Update Project"

      expect(page).to have_content("I am edited")
    end

    scenario "User deletes a project" do

      Project.create!(
      name: "delete me"
      )
      visit root_path
      click_on "Projects"
      click_on "delete me"
      click_on "delete-project-action"

      expect(page).to have_no_content("delete me")
    end  


  end

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
