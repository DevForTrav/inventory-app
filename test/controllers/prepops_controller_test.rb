require "test_helper"

class PrepopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prepop = prepops(:one)
  end

  test "should get index" do
    get prepops_url
    assert_response :success
  end

  test "should get new" do
    get new_prepop_url
    assert_response :success
  end

  test "should create prepop" do
    assert_difference("Prepop.count") do
      post prepops_url, params: { prepop: { due_date: @prepop.due_date, name: @prepop.name, weekly_need: @prepop.weekly_need, weekly_quantity: @prepop.weekly_quantity, wire_harness_id: @prepop.wire_harness_id } }
    end

    assert_redirected_to prepop_url(Prepop.last)
  end

  test "should show prepop" do
    get prepop_url(@prepop)
    assert_response :success
  end

  test "should get edit" do
    get edit_prepop_url(@prepop)
    assert_response :success
  end

  test "should update prepop" do
    patch prepop_url(@prepop), params: { prepop: { due_date: @prepop.due_date, name: @prepop.name, weekly_need: @prepop.weekly_need, weekly_quantity: @prepop.weekly_quantity, wire_harness_id: @prepop.wire_harness_id } }
    assert_redirected_to prepop_url(@prepop)
  end

  test "should destroy prepop" do
    assert_difference("Prepop.count", -1) do
      delete prepop_url(@prepop)
    end

    assert_redirected_to prepops_url
  end
end
