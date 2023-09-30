require "test_helper"

class WiringHarnessConnectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wiring_harness_connector = wiring_harness_connectors(:one)
  end

  test "should get index" do
    get wiring_harness_connectors_url
    assert_response :success
  end

  test "should get new" do
    get new_wiring_harness_connector_url
    assert_response :success
  end

  test "should create wiring_harness_connector" do
    assert_difference("WiringHarnessConnector.count") do
      post wiring_harness_connectors_url, params: { wiring_harness_connector: {  } }
    end

    assert_redirected_to wiring_harness_connector_url(WiringHarnessConnector.last)
  end

  test "should show wiring_harness_connector" do
    get wiring_harness_connector_url(@wiring_harness_connector)
    assert_response :success
  end

  test "should get edit" do
    get edit_wiring_harness_connector_url(@wiring_harness_connector)
    assert_response :success
  end

  test "should update wiring_harness_connector" do
    patch wiring_harness_connector_url(@wiring_harness_connector), params: { wiring_harness_connector: {  } }
    assert_redirected_to wiring_harness_connector_url(@wiring_harness_connector)
  end

  test "should destroy wiring_harness_connector" do
    assert_difference("WiringHarnessConnector.count", -1) do
      delete wiring_harness_connector_url(@wiring_harness_connector)
    end

    assert_redirected_to wiring_harness_connectors_url
  end
end
