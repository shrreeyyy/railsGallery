require "application_system_test_case"

class GaleriesTest < ApplicationSystemTestCase
  setup do
    @galery = galeries(:one)
  end

  test "visiting the index" do
    visit galeries_url
    assert_selector "h1", text: "Galeries"
  end

  test "creating a Galery" do
    visit galeries_url
    click_on "New Galery"

    fill_in "Description", with: @galery.description
    fill_in "Email", with: @galery.email
    fill_in "Gallery title", with: @galery.gallery_title
    check "Published" if @galery.published
    click_on "Create Galery"

    assert_text "Galery was successfully created"
    click_on "Back"
  end

  test "updating a Galery" do
    visit galeries_url
    click_on "Edit", match: :first

    fill_in "Description", with: @galery.description
    fill_in "Email", with: @galery.email
    fill_in "Gallery title", with: @galery.gallery_title
    check "Published" if @galery.published
    click_on "Update Galery"

    assert_text "Galery was successfully updated"
    click_on "Back"
  end

  test "destroying a Galery" do
    visit galeries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Galery was successfully destroyed"
  end
end
