require "test_helper"

class UncutWiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uncut_wire = uncut_wires(:one)
  end

  test "should get index" do
    get uncut_wires_url
    assert_response :success
  end

  test "should get new" do
    get new_uncut_wire_url
    assert_response :success
  end

  test "should create uncut_wire" do
    assert_difference("UncutWire.count") do
      post uncut_wires_url, params: { uncut_wire: { date_ordered: @uncut_wire.date_ordered, gauge: @uncut_wire.gauge, length_in_cm: @uncut_wire.length_in_cm, part_number: @uncut_wire.part_number, primary_color: @uncut_wire.primary_color, secondary_color: @uncut_wire.secondary_color } }
    end

    assert_redirected_to uncut_wire_url(UncutWire.last)
  end

  test "should show uncut_wire" do
    get uncut_wire_url(@uncut_wire)
    assert_response :success
  end

  test "should get edit" do
    get edit_uncut_wire_url(@uncut_wire)
    assert_response :success
  end

  test "should update uncut_wire" do
    patch uncut_wire_url(@uncut_wire), params: { uncut_wire: { date_ordered: @uncut_wire.date_ordered, gauge: @uncut_wire.gauge, length_in_cm: @uncut_wire.length_in_cm, part_number: @uncut_wire.part_number, primary_color: @uncut_wire.primary_color, secondary_color: @uncut_wire.secondary_color } }
    assert_redirected_to uncut_wire_url(@uncut_wire)
  end

  test "should destroy uncut_wire" do
    assert_difference("UncutWire.count", -1) do
      delete uncut_wire_url(@uncut_wire)
    end

    assert_redirected_to uncut_wires_url
  end
end
