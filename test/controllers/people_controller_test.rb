require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { date_of_birth: @person.date_of_birth, email: 'test1@aber.ac.uk', forenames: @person.forenames, license_period: @person.license_period, license_type: @person.license_type, occupation: @person.occupation, surname: @person.surname, telephone_number: @person.telephone_number, title: @person.title , user_id: '1'}
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { date_of_birth: @person.date_of_birth, email: @person.email, forenames: @person.forenames, license_period: @person.license_period, license_type: @person.license_type, occupation: @person.occupation, surname: @person.surname, telephone_number: @person.telephone_number, title: @person.title, user_id: '1' }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end