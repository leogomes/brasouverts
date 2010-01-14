require 'test_helper'

class MembresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membre" do
    assert_difference('Membre.count') do
      post :create, :membre => { }
    end

    assert_redirected_to membre_path(assigns(:membre))
  end

  test "should show membre" do
    get :show, :id => membres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => membres(:one).to_param
    assert_response :success
  end

  test "should update membre" do
    put :update, :id => membres(:one).to_param, :membre => { }
    assert_redirected_to membre_path(assigns(:membre))
  end

  test "should destroy membre" do
    assert_difference('Membre.count', -1) do
      delete :destroy, :id => membres(:one).to_param
    end

    assert_redirected_to membres_path
  end
end
