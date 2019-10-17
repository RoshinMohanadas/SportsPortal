require "application_system_test_case"

class EventgroupsTest < ApplicationSystemTestCase
  setup do
    @eventgroup = eventgroups(:one)
  end

  test "visiting the index" do
    visit eventgroups_url
    assert_selector "h1", text: "Eventgroups"
  end

  test "creating a Eventgroup" do
    visit eventgroups_url
    click_on "New Eventgroup"

    fill_in "Description", with: @eventgroup.description
    fill_in "Enddate", with: @eventgroup.enddate
    check "Isactive" if @eventgroup.isactive
    fill_in "Name", with: @eventgroup.name
    fill_in "Regenddate", with: @eventgroup.regenddate
    fill_in "Regstartdate", with: @eventgroup.regstartdate
    fill_in "Startdate", with: @eventgroup.startdate
    fill_in "Venue", with: @eventgroup.venue
    click_on "Create Eventgroup"

    assert_text "Eventgroup was successfully created"
    click_on "Back"
  end

  test "updating a Eventgroup" do
    visit eventgroups_url
    click_on "Edit", match: :first

    fill_in "Description", with: @eventgroup.description
    fill_in "Enddate", with: @eventgroup.enddate
    check "Isactive" if @eventgroup.isactive
    fill_in "Name", with: @eventgroup.name
    fill_in "Regenddate", with: @eventgroup.regenddate
    fill_in "Regstartdate", with: @eventgroup.regstartdate
    fill_in "Startdate", with: @eventgroup.startdate
    fill_in "Venue", with: @eventgroup.venue
    click_on "Update Eventgroup"

    assert_text "Eventgroup was successfully updated"
    click_on "Back"
  end

  test "destroying a Eventgroup" do
    visit eventgroups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eventgroup was successfully destroyed"
  end
end
