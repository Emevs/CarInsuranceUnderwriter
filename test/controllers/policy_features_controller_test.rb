require 'test_helper'

class PolicyFeaturesControllerTest < ActionController::TestCase
  setup do
    @policy_feature = policy_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:policy_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create policy_feature" do
    assert_difference('PolicyFeature.count') do
      post :create, policy_feature: { breakdown_cover: @policy_feature.breakdown_cover, policy_excess: @policy_feature.policy_excess, vehicle_id: @policy_feature.vehicle_id, windscreen_excess: @policy_feature.windscreen_excess, windscreen_repair: @policy_feature.windscreen_repair }
    end

    assert_redirected_to policy_feature_path(assigns(:policy_feature))
  end

  test "should show policy_feature" do
    get :show, id: @policy_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @policy_feature
    assert_response :success
  end

  test "should update policy_feature" do
    patch :update, id: @policy_feature, policy_feature: { breakdown_cover: @policy_feature.breakdown_cover, policy_excess: @policy_feature.policy_excess, vehicle_id: @policy_feature.vehicle_id, windscreen_excess: @policy_feature.windscreen_excess, windscreen_repair: @policy_feature.windscreen_repair }
    assert_redirected_to policy_feature_path(assigns(:policy_feature))
  end

  test "should destroy policy_feature" do
    assert_difference('PolicyFeature.count', -1) do
      delete :destroy, id: @policy_feature
    end

    assert_redirected_to policy_features_path
  end
end
