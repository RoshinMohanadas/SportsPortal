require "application_system_test_case"

class NewsfilesTest < ApplicationSystemTestCase
  setup do
    @newsfile = newsfiles(:one)
  end

  test "visiting the index" do
    visit newsfiles_url
    assert_selector "h1", text: "Newsfiles"
  end

  test "creating a Newsfile" do
    visit newsfiles_url
    click_on "New Newsfile"

    fill_in "Description", with: @newsfile.description
    fill_in "Title", with: @newsfile.title
    click_on "Create Newsfile"

    assert_text "Newsfile was successfully created"
    click_on "Back"
  end

  test "updating a Newsfile" do
    visit newsfiles_url
    click_on "Edit", match: :first

    fill_in "Description", with: @newsfile.description
    fill_in "Title", with: @newsfile.title
    click_on "Update Newsfile"

    assert_text "Newsfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Newsfile" do
    visit newsfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Newsfile was successfully destroyed"
  end
end
