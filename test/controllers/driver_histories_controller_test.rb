require 'test_helper'

class DriverHistoriesControllerTest < ActionController::TestCase
  setup do
    @driver_history = driver_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driver_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver_history" do
    assert_difference('DriverHistory.count') do
      post :create, driver_history: {person_id: @driver_history.person_id, number_of_incidents: @driver_history.number_of_incidents }
    end

    assert_redirected_to driver_history_path(assigns(:driver_history))
  end

  test "should show driver_history" do
    get :show, id: @driver_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver_history
    assert_response :success
  end

  test "should update driver_history" do
    patch :update, id: @driver_history, driver_history: {person_id: @driver_history.person_id, number_of_incidents: @driver_history.number_of_incidents }
    assert_redirected_to driver_history_path(assigns(:driver_history))
  end

  test "should destroy driver_history" do
    assert_difference('DriverHistory.count', -1) do
      delete :destroy, id: @driver_history
    end

    assert_redirected_to driver_histories_path
  end
end
