require 'test_helper'

class FriendInvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get friend_invites_new_url
    assert_response :success
  end

  test "should get create" do
    get friend_invites_create_url
    assert_response :success
  end

  test "should get edit" do
    get friend_invites_edit_url
    assert_response :success
  end

  test "should get update" do
    get friend_invites_update_url
    assert_response :success
  end

end
