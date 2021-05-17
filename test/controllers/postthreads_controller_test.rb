require 'test_helper'

class PostthreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get postthreads_new_url
    assert_response :success
  end

  test "should get create" do
    get postthreads_create_url
    assert_response :success
  end

  test "should get update" do
    get postthreads_update_url
    assert_response :success
  end

  test "should get edit" do
    get postthreads_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get postthreads_destroy_url
    assert_response :success
  end

end
