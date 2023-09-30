require "application_system_test_case"

class WiringHarnessesTest < ApplicationSystemTestCase
  setup do
    @wiring_harness = wiring_harnesses(:one)
  end

  test "visiting the index" do
    visit wiring_harnesses_url
    assert_selector "h1", text: "Wiring harnesses"
  end

  test "should create wiring harness" do
    visit wiring_harnesses_url
    click_on "New wiring harness"

    fill_in "Company", with: @wiring_harness.company
    fill_in "Harnesses completed", with: @wiring_harness.harnesses_completed
    fill_in "Name", with: @wiring_harness.name
    fill_in "User", with: @wiring_harness.user_id
    fill_in "Weekly quantity", with: @wiring_harness.weekly_quantity
    click_on "Create Wiring harness"

    assert_text "Wiring harness was successfully created"
    click_on "Back"
  end

  test "should update Wiring harness" do
    visit wiring_harness_url(@wiring_harness)
    click_on "Edit this wiring harness", match: :first

    fill_in "Company", with: @wiring_harness.company
    fill_in "Harnesses completed", with: @wiring_harness.harnesses_completed
    fill_in "Name", with: @wiring_harness.name
    fill_in "User", with: @wiring_harness.user_id
    fill_in "Weekly quantity", with: @wiring_harness.weekly_quantity
    click_on "Update Wiring harness"

    assert_text "Wiring harness was successfully updated"
    click_on "Back"
  end

  test "should destroy Wiring harness" do
    visit wiring_harness_url(@wiring_harness)
    click_on "Destroy this wiring harness", match: :first

    assert_text "Wiring harness was successfully destroyed"
  end
end
