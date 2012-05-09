require 'test_helper'

class ReservesControllerTest < ActionController::TestCase
  setup do
    @reserf = reserves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserf" do
    assert_difference('Reserve.count') do
      post :create, :reserf => { :cantidad => @reserf.cantidad, :estado => @reserf.estado }
    end

    assert_redirected_to reserf_path(assigns(:reserf))
  end

  test "should show reserf" do
    get :show, :id => @reserf
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reserf
    assert_response :success
  end

  test "should update reserf" do
    put :update, :id => @reserf, :reserf => { :cantidad => @reserf.cantidad, :estado => @reserf.estado }
    assert_redirected_to reserf_path(assigns(:reserf))
  end

  test "should destroy reserf" do
    assert_difference('Reserve.count', -1) do
      delete :destroy, :id => @reserf
    end

    assert_redirected_to reserves_path
  end
end
