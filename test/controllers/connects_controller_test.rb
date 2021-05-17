require 'test_helper'

class ConnectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get connects_new_url
    assert_response :success
  end

  test "should get edit" do
    get connects_edit_url
    assert_response :success
  end

  test "should get update" do
    get connects_update_url
    assert_response :success
  end

  test "should get create" do
    get connects_create_url
    assert_response :success
  end

end
