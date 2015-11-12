require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get list_registrations" do
    get :list_registrations
    assert_response :success
  end

end
