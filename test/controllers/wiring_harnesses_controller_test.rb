require "test_helper"

class WiringHarnessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wiring_harness = wiring_harnesses(:one)
  end

  test "should get index" do
    get wiring_harnesses_url
    assert_response :success
  end

  test "should get new" do
    get new_wiring_harness_url
    assert_response :success
  end

  test "should create wiring_harness" do
    assert_difference("WiringHarness.count") do
      post wiring_harnesses_url, params: { wiring_harness: { company: @wiring_harness.company, harnesses_completed: @wiring_harness.harnesses_completed, name: @wiring_harness.name, user_id: @wiring_harness.user_id, weekly_quantity: @wiring_harness.weekly_quantity } }
    end

    assert_redirected_to wiring_harness_url(WiringHarness.last)
  end

  test "should show wiring_harness" do
    get wiring_harness_url(@wiring_harness)
    assert_response :success
  end

  test "should get edit" do
    get edit_wiring_harness_url(@wiring_harness)
    assert_response :success
  end

  test "should update wiring_harness" do
    patch wiring_harness_url(@wiring_harness), params: { wiring_harness: { company: @wiring_harness.company, harnesses_completed: @wiring_harness.harnesses_completed, name: @wiring_harness.name, user_id: @wiring_harness.user_id, weekly_quantity: @wiring_harness.weekly_quantity } }
    assert_redirected_to wiring_harness_url(@wiring_harness)
  end

  test "should destroy wiring_harness" do
    assert_difference("WiringHarness.count", -1) do
      delete wiring_harness_url(@wiring_harness)
    end

    assert_redirected_to wiring_harnesses_url
  end
end
