require "application_system_test_case"

class PreppedWiresTest < ApplicationSystemTestCase
  setup do
    @prepped_wire = prepped_wires(:one)
  end

  test "visiting the index" do
    visit prepped_wires_url
    assert_selector "h1", text: "Prepped wires"
  end

  test "should create prepped wire" do
    visit prepped_wires_url
    click_on "New prepped wire"

    fill_in "P1 terminal", with: @prepped_wire.p1_terminal
    fill_in "P2 terminal", with: @prepped_wire.p2_terminal
    fill_in "Prepop", with: @prepped_wire.prepop_id
    fill_in "Uncut wire", with: @prepped_wire.uncut_wire_id
    click_on "Create Prepped wire"

    assert_text "Prepped wire was successfully created"
    click_on "Back"
  end

  test "should update Prepped wire" do
    visit prepped_wire_url(@prepped_wire)
    click_on "Edit this prepped wire", match: :first

    fill_in "P1 terminal", with: @prepped_wire.p1_terminal
    fill_in "P2 terminal", with: @prepped_wire.p2_terminal
    fill_in "Prepop", with: @prepped_wire.prepop_id
    fill_in "Uncut wire", with: @prepped_wire.uncut_wire_id
    click_on "Update Prepped wire"

    assert_text "Prepped wire was successfully updated"
    click_on "Back"
  end

  test "should destroy Prepped wire" do
    visit prepped_wire_url(@prepped_wire)
    click_on "Destroy this prepped wire", match: :first

    assert_text "Prepped wire was successfully destroyed"
  end
end
