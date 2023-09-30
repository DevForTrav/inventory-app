require "application_system_test_case"

class PrepopsTest < ApplicationSystemTestCase
  setup do
    @prepop = prepops(:one)
  end

  test "visiting the index" do
    visit prepops_url
    assert_selector "h1", text: "Prepops"
  end

  test "should create prepop" do
    visit prepops_url
    click_on "New prepop"

    fill_in "Due date", with: @prepop.due_date
    fill_in "Name", with: @prepop.name
    fill_in "Weekly need", with: @prepop.weekly_need
    fill_in "Weekly quantity", with: @prepop.weekly_quantity
    fill_in "Wire harness", with: @prepop.wire_harness_id
    click_on "Create Prepop"

    assert_text "Prepop was successfully created"
    click_on "Back"
  end

  test "should update Prepop" do
    visit prepop_url(@prepop)
    click_on "Edit this prepop", match: :first

    fill_in "Due date", with: @prepop.due_date
    fill_in "Name", with: @prepop.name
    fill_in "Weekly need", with: @prepop.weekly_need
    fill_in "Weekly quantity", with: @prepop.weekly_quantity
    fill_in "Wire harness", with: @prepop.wire_harness_id
    click_on "Update Prepop"

    assert_text "Prepop was successfully updated"
    click_on "Back"
  end

  test "should destroy Prepop" do
    visit prepop_url(@prepop)
    click_on "Destroy this prepop", match: :first

    assert_text "Prepop was successfully destroyed"
  end
end
