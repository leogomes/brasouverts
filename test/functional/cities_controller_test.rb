require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index, {:q => "An"}, {:format => "js"}
    assert_response :success
    assert_not_nil assigns(:cities)
    assert assigns(:cities).size > 0
  end


end
