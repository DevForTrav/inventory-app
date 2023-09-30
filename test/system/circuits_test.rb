require "application_system_test_case"

class CircuitsTest < ApplicationSystemTestCase
  setup do
    @circuit = circuits(:one)
  end

  test "visiting the index" do
    visit circuits_url
    assert_selector "h1", text: "Circuits"
  end

  test "should create circuit" do
    visit circuits_url
    click_on "New circuit"

    fill_in "Length", with: @circuit.length
    fill_in "Number", with: @circuit.number
    fill_in "P1 terminal", with: @circuit.p1_terminal_id
    fill_in "P2 terminal", with: @circuit.p2_terminal_id
    fill_in "Position", with: @circuit.position
    fill_in "Quantity", with: @circuit.quantity
    click_on "Create Circuit"

    assert_text "Circuit was successfully created"
    click_on "Back"
  end

  test "should update Circuit" do
    visit circuit_url(@circuit)
    click_on "Edit this circuit", match: :first

    fill_in "Length", with: @circuit.length
    fill_in "Number", with: @circuit.number
    fill_in "P1 terminal", with: @circuit.p1_terminal_id
    fill_in "P2 terminal", with: @circuit.p2_terminal_id
    fill_in "Position", with: @circuit.position
    fill_in "Quantity", with: @circuit.quantity
    click_on "Update Circuit"

    assert_text "Circuit was successfully updated"
    click_on "Back"
  end

  test "should destroy Circuit" do
    visit circuit_url(@circuit)
    click_on "Destroy this circuit", match: :first

    assert_text "Circuit was successfully destroyed"
  end
end
