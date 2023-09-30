require "application_system_test_case"

class UncutWiresTest < ApplicationSystemTestCase
  setup do
    @uncut_wire = uncut_wires(:one)
  end

  test "visiting the index" do
    visit uncut_wires_url
    assert_selector "h1", text: "Uncut wires"
  end

  test "should create uncut wire" do
    visit uncut_wires_url
    click_on "New uncut wire"

    fill_in "Date ordered", with: @uncut_wire.date_ordered
    fill_in "Gauge", with: @uncut_wire.gauge
    fill_in "Length in cm", with: @uncut_wire.length_in_cm
    fill_in "Part number", with: @uncut_wire.part_number
    fill_in "Primary color", with: @uncut_wire.primary_color
    fill_in "Secondary color", with: @uncut_wire.secondary_color
    click_on "Create Uncut wire"

    assert_text "Uncut wire was successfully created"
    click_on "Back"
  end

  test "should update Uncut wire" do
    visit uncut_wire_url(@uncut_wire)
    click_on "Edit this uncut wire", match: :first

    fill_in "Date ordered", with: @uncut_wire.date_ordered
    fill_in "Gauge", with: @uncut_wire.gauge
    fill_in "Length in cm", with: @uncut_wire.length_in_cm
    fill_in "Part number", with: @uncut_wire.part_number
    fill_in "Primary color", with: @uncut_wire.primary_color
    fill_in "Secondary color", with: @uncut_wire.secondary_color
    click_on "Update Uncut wire"

    assert_text "Uncut wire was successfully updated"
    click_on "Back"
  end

  test "should destroy Uncut wire" do
    visit uncut_wire_url(@uncut_wire)
    click_on "Destroy this uncut wire", match: :first

    assert_text "Uncut wire was successfully destroyed"
  end
end
