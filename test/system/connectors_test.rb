require "application_system_test_case"

class ConnectorsTest < ApplicationSystemTestCase
  setup do
    @connector = connectors(:one)
  end

  test "visiting the index" do
    visit connectors_url
    assert_selector "h1", text: "Connectors"
  end

  test "should create connector" do
    visit connectors_url
    click_on "New connector"

    fill_in "Company", with: @connector.company
    fill_in "Name", with: @connector.name
    fill_in "Part number", with: @connector.part_number
    fill_in "Positions", with: @connector.positions
    fill_in "Prepop", with: @connector.prepop_id
    fill_in "Terminal", with: @connector.terminal_id
    click_on "Create Connector"

    assert_text "Connector was successfully created"
    click_on "Back"
  end

  test "should update Connector" do
    visit connector_url(@connector)
    click_on "Edit this connector", match: :first

    fill_in "Company", with: @connector.company
    fill_in "Name", with: @connector.name
    fill_in "Part number", with: @connector.part_number
    fill_in "Positions", with: @connector.positions
    fill_in "Prepop", with: @connector.prepop_id
    fill_in "Terminal", with: @connector.terminal_id
    click_on "Update Connector"

    assert_text "Connector was successfully updated"
    click_on "Back"
  end

  test "should destroy Connector" do
    visit connector_url(@connector)
    click_on "Destroy this connector", match: :first

    assert_text "Connector was successfully destroyed"
  end
end
