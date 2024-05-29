require "test_helper"

class LineItemDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get line_item_dates_new_url
    assert_response :success
  end

  test "should get create" do
    get line_item_dates_create_url
    assert_response :success
  end

  test "should get edit" do
    get line_item_dates_edit_url
    assert_response :success
  end

  test "should get update" do
    get line_item_dates_update_url
    assert_response :success
  end

  test "should get destory" do
    get line_item_dates_destory_url
    assert_response :success
  end
end
