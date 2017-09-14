require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get auth_spotify_callback_path
    assert_response :redirect
  end


end
