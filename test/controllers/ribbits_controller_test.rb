require 'test_helper'

class RibbitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
