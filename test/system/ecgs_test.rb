require "application_system_test_case"

class EcgsTest < ApplicationSystemTestCase
  setup do
    @ecg = ecgs(:one)
  end

  test "visiting the index" do
    visit ecgs_url
    assert_selector "h1", text: "Ecgs"
  end

  test "should create ecg" do
    visit ecgs_url
    click_on "New ecg"

    fill_in "Facts", with: @ecg.facts
    fill_in "Name", with: @ecg.name
    click_on "Create Ecg"

    assert_text "Ecg was successfully created"
    click_on "Back"
  end

  test "should update Ecg" do
    visit ecg_url(@ecg)
    click_on "Edit this ecg", match: :first

    fill_in "Facts", with: @ecg.facts
    fill_in "Name", with: @ecg.name
    click_on "Update Ecg"

    assert_text "Ecg was successfully updated"
    click_on "Back"
  end

  test "should destroy Ecg" do
    visit ecg_url(@ecg)
    click_on "Destroy this ecg", match: :first

    assert_text "Ecg was successfully destroyed"
  end
end
