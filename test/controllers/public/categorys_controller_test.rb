require "test_helper"

class Public::CategorysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_categorys_index_url
    assert_response :success
  end

  test "should get create" do
    get public_categorys_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_categorys_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_categorys_update_url
    assert_response :success
  end
end
