require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @team = teams(:one)
  end

  test "visiting the index" do
    visit teams_url
    assert_selector "h1", text: "Teams"
  end

  test "creating a Team" do
    visit teams_url
    click_on "New Team"

    fill_in "Arrivaldate", with: @team.arrivaldate
    fill_in "Arrivaldetails", with: @team.arrivaldetails
    fill_in "Arrivalloc", with: @team.arrivalloc
    fill_in "Departuredate", with: @team.departuredate
    fill_in "Departuredetails", with: @team.departuredetails
    fill_in "Departureloc", with: @team.departureloc
    fill_in "Event", with: @team.event_id
    fill_in "Instructionsfromadmin", with: @team.instructionsfromadmin
    fill_in "Modeofarrival", with: @team.modeofarrival
    fill_in "Modeofdeparture", with: @team.modeofdeparture
    fill_in "Name", with: @team.name
    fill_in "Poc", with: @team.poc
    fill_in "Pocemail", with: @team.pocemail
    fill_in "Pocmobile", with: @team.pocmobile
    fill_in "User", with: @team.user_id
    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "updating a Team" do
    visit teams_url
    click_on "Edit", match: :first

    fill_in "Arrivaldate", with: @team.arrivaldate
    fill_in "Arrivaldetails", with: @team.arrivaldetails
    fill_in "Arrivalloc", with: @team.arrivalloc
    fill_in "Departuredate", with: @team.departuredate
    fill_in "Departuredetails", with: @team.departuredetails
    fill_in "Departureloc", with: @team.departureloc
    fill_in "Event", with: @team.event_id
    fill_in "Instructionsfromadmin", with: @team.instructionsfromadmin
    fill_in "Modeofarrival", with: @team.modeofarrival
    fill_in "Modeofdeparture", with: @team.modeofdeparture
    fill_in "Name", with: @team.name
    fill_in "Poc", with: @team.poc
    fill_in "Pocemail", with: @team.pocemail
    fill_in "Pocmobile", with: @team.pocmobile
    fill_in "User", with: @team.user_id
    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "destroying a Team" do
    visit teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team was successfully destroyed"
  end
end
