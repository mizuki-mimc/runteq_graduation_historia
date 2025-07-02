require "test_helper"

class WorldGuideFeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get world_guide_features_show_url
    assert_response :success
  end

  test "should get edit" do
    get world_guide_features_edit_url
    assert_response :success
  end

  test "should get update" do
    get world_guide_features_update_url
    assert_response :success
  end
end
