require "application_system_test_case"

class WiringHarnessConnectorsTest < ApplicationSystemTestCase
  setup do
    @wiring_harness_connector = wiring_harness_connectors(:one)
  end

  test "visiting the index" do
    visit wiring_harness_connectors_url
    assert_selector "h1", text: "Wiring harness connectors"
  end

  test "should create wiring harness connector" do
    visit wiring_harness_connectors_url
    click_on "New wiring harness connector"

    click_on "Create Wiring harness connector"

    assert_text "Wiring harness connector was successfully created"
    click_on "Back"
  end

  test "should update Wiring harness connector" do
    visit wiring_harness_connector_url(@wiring_harness_connector)
    click_on "Edit this wiring harness connector", match: :first

    click_on "Update Wiring harness connector"

    assert_text "Wiring harness connector was successfully updated"
    click_on "Back"
  end

  test "should destroy Wiring harness connector" do
    visit wiring_harness_connector_url(@wiring_harness_connector)
    click_on "Destroy this wiring harness connector", match: :first

    assert_text "Wiring harness connector was successfully destroyed"
  end
end
