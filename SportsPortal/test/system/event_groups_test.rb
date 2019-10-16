require "application_system_test_case"

class EventGroupsTest < ApplicationSystemTestCase
  setup do
    @event_group = event_groups(:one)
  end

  test "visiting the index" do
    visit event_groups_url
    assert_selector "h1", text: "Event Groups"
  end

  test "creating a Event group" do
    visit event_groups_url
    click_on "New Event Group"

    fill_in "Description", with: @event_group.description
    fill_in "End date", with: @event_group.end_date
    check "Is active" if @event_group.is_active
    fill_in "Name", with: @event_group.name
    fill_in "Reg end date", with: @event_group.reg_end_date
    fill_in "Reg start date", with: @event_group.reg_start_date
    fill_in "Start date", with: @event_group.start_date
    fill_in "Venue", with: @event_group.venue
    click_on "Create Event group"

    assert_text "Event group was successfully created"
    click_on "Back"
  end

  test "updating a Event group" do
    visit event_groups_url
    click_on "Edit", match: :first

    fill_in "Description", with: @event_group.description
    fill_in "End date", with: @event_group.end_date
    check "Is active" if @event_group.is_active
    fill_in "Name", with: @event_group.name
    fill_in "Reg end date", with: @event_group.reg_end_date
    fill_in "Reg start date", with: @event_group.reg_start_date
    fill_in "Start date", with: @event_group.start_date
    fill_in "Venue", with: @event_group.venue
    click_on "Update Event group"

    assert_text "Event group was successfully updated"
    click_on "Back"
  end

  test "destroying a Event group" do
    visit event_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event group was successfully destroyed"
  end
end
