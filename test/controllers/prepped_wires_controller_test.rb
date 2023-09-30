require "test_helper"

class PreppedWiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prepped_wire = prepped_wires(:one)
  end

  test "should get index" do
    get prepped_wires_url
    assert_response :success
  end

  test "should get new" do
    get new_prepped_wire_url
    assert_response :success
  end

  test "should create prepped_wire" do
    assert_difference("PreppedWire.count") do
      post prepped_wires_url, params: { prepped_wire: { p1_terminal: @prepped_wire.p1_terminal, p2_terminal: @prepped_wire.p2_terminal, prepop_id: @prepped_wire.prepop_id, uncut_wire_id: @prepped_wire.uncut_wire_id } }
    end

    assert_redirected_to prepped_wire_url(PreppedWire.last)
  end

  test "should show prepped_wire" do
    get prepped_wire_url(@prepped_wire)
    assert_response :success
  end

  test "should get edit" do
    get edit_prepped_wire_url(@prepped_wire)
    assert_response :success
  end

  test "should update prepped_wire" do
    patch prepped_wire_url(@prepped_wire), params: { prepped_wire: { p1_terminal: @prepped_wire.p1_terminal, p2_terminal: @prepped_wire.p2_terminal, prepop_id: @prepped_wire.prepop_id, uncut_wire_id: @prepped_wire.uncut_wire_id } }
    assert_redirected_to prepped_wire_url(@prepped_wire)
  end

  test "should destroy prepped_wire" do
    assert_difference("PreppedWire.count", -1) do
      delete prepped_wire_url(@prepped_wire)
    end

    assert_redirected_to prepped_wires_url
  end
end
