require "application_system_test_case"

class EditcontentsTest < ApplicationSystemTestCase
  setup do
    @editcontent = editcontents(:one)
  end

  test "visiting the index" do
    visit editcontents_url
    assert_selector "h1", text: "Editcontents"
  end

  test "creating a Editcontent" do
    visit editcontents_url
    click_on "New Editcontent"

    fill_in "About", with: @editcontent.about
    fill_in "Contact", with: @editcontent.contact
    fill_in "Facilities", with: @editcontent.facilities
    fill_in "Welcometext", with: @editcontent.welcometext
    click_on "Create Editcontent"

    assert_text "Editcontent was successfully created"
    click_on "Back"
  end

  test "updating a Editcontent" do
    visit editcontents_url
    click_on "Edit", match: :first

    fill_in "About", with: @editcontent.about
    fill_in "Contact", with: @editcontent.contact
    fill_in "Facilities", with: @editcontent.facilities
    fill_in "Welcometext", with: @editcontent.welcometext
    click_on "Update Editcontent"

    assert_text "Editcontent was successfully updated"
    click_on "Back"
  end

  test "destroying a Editcontent" do
    visit editcontents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Editcontent was successfully destroyed"
  end
end
