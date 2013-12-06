require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @personal_details = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_details" do
    assert_difference('personal_details.count') do
      post :create, personal_details: { date_of_birth: @personal_details.date_of_birth, email: 'test1@aber.ac.uk', forenames: @personal_details.forenames, license_period: @personal_details.license_period, license_type: @personal_details.license_type, occupation: @personal_details.occupation, surname: @personal_details.surname, telephone_number: @personal_details.telephone_number, title: @personal_details.title , user_id: '1'}
    end

    assert_redirected_to person_path(assigns(:personal_details))
  end

  test "should show personal_details" do
    get :show, id: @personal_details
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_details
    assert_response :success
  end

  test "should update personal_details" do
    patch :update, id: @personal_details, personal_details: { date_of_birth: @personal_details.date_of_birth, email: @personal_details.email, forenames: @personal_details.forenames, license_period: @personal_details.license_period, license_type: @personal_details.license_type, occupation: @personal_details.occupation, surname: @personal_details.surname, telephone_number: @personal_details.telephone_number, title: @personal_details.title, user_id: '1' }
    assert_redirected_to person_path(assigns(:personal_details))
  end

  test "should destroy personal_details" do
    assert_difference('personal_details.count', -1) do
      delete :destroy, id: @personal_details
    end

    assert_redirected_to people_path
  end
end
