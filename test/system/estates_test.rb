require "application_system_test_case"

class EstatesTest < ApplicationSystemTestCase
  setup do
    @estate = estates(:one)
  end

  test "visiting the index" do
    visit estates_url
    assert_selector "h1", text: "Estates"
  end

  test "creating a Estate" do
    visit estates_url
    click_on "New Estate"

    fill_in "Adress", with: @estate.adress
    fill_in "Content", with: @estate.content
    fill_in "Name", with: @estate.name
    fill_in "Price", with: @estate.price
    fill_in "Year", with: @estate.year
    click_on "Create Estate"

    assert_text "Estate was successfully created"
    click_on "Back"
  end

  test "updating a Estate" do
    visit estates_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @estate.adress
    fill_in "Content", with: @estate.content
    fill_in "Name", with: @estate.name
    fill_in "Price", with: @estate.price
    fill_in "Year", with: @estate.year
    click_on "Update Estate"

    assert_text "Estate was successfully updated"
    click_on "Back"
  end

  test "destroying a Estate" do
    visit estates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estate was successfully destroyed"
  end
end
