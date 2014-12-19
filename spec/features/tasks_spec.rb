require 'rails_helper'

  feature "Tasks" do

    scenario "User creates a task" do

      visit root_path
      click_on "Tasks"
      click_on "New Task"
      fill_in "task_description", with: "Created Task"
      fill_in "Due date", with: "2014-12-31"
      click_on "Create Task"
      expect(page).to have_content("Created Task")
      expect(page).to have_content("12/31/2014")
    end

    scenario "User edits a task" do
      Task.create!(
        description: "Christmas Shopping",
        due_date: "2014-12-24",
      )

      visit root_path
      click_on "Tasks"
      click_on "edit-task-action"
      fill_in "task_description", with: "Better Christmas Shopping"
      check :task_completed
      click_on "Update Task"
      expect(page).to have_content("Better Christmas Shopping")
      expect(page).to have_content("Completed true")
    end

    scenario "User deletes a task" do
      Task.create!(
        description: "Delete me",
        due_date: "2014-12-24",
      )

      visit root_path
      click_on "Tasks"
      click_on "Delete"

      expect(page).to have_no_content("Delete me")
    end


  #   scenario "User edits a task" do
  #     Task.create!(
  #     des
  #     )
  end

# require 'rails_helper'
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
