require 'test_helper'

class ControlControllerTest < ActionDispatch::IntegrationTest
  test "should get create_account" do
    get control_create_account_url
    assert_response :success
  end

  test "should get get_daily" do
    get control_get_daily_url
    assert_response :success
  end

  test "should get set_prefs" do
    get control_set_prefs_url
    assert_response :success
  end

  test "should get people_interested" do
    get control_people_interested_url
    assert_response :success
  end

end
