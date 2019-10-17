require "application_system_test_case"

class TeammembersTest < ApplicationSystemTestCase
  setup do
    @teammember = teammembers(:one)
  end

  test "visiting the index" do
    visit teammembers_url
    assert_selector "h1", text: "Teammembers"
  end

  test "creating a Teammember" do
    visit teammembers_url
    click_on "New Teammember"

    fill_in "Achievements", with: @teammember.achievements
    fill_in "Contactno", with: @teammember.contactno
    fill_in "Dob", with: @teammember.dob
    fill_in "Email", with: @teammember.email
    fill_in "Foodpreference", with: @teammember.foodpreference
    fill_in "Gender", with: @teammember.gender
    fill_in "Name", with: @teammember.name
    fill_in "Role", with: @teammember.role
    fill_in "Team", with: @teammember.team_id
    click_on "Create Teammember"

    assert_text "Teammember was successfully created"
    click_on "Back"
  end

  test "updating a Teammember" do
    visit teammembers_url
    click_on "Edit", match: :first

    fill_in "Achievements", with: @teammember.achievements
    fill_in "Contactno", with: @teammember.contactno
    fill_in "Dob", with: @teammember.dob
    fill_in "Email", with: @teammember.email
    fill_in "Foodpreference", with: @teammember.foodpreference
    fill_in "Gender", with: @teammember.gender
    fill_in "Name", with: @teammember.name
    fill_in "Role", with: @teammember.role
    fill_in "Team", with: @teammember.team_id
    click_on "Update Teammember"

    assert_text "Teammember was successfully updated"
    click_on "Back"
  end

  test "destroying a Teammember" do
    visit teammembers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teammember was successfully destroyed"
  end
end
