require "test_helper"

class CharacterFeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get character_features_show_url
    assert_response :success
  end

  test "should get edit" do
    get character_features_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_features_update_url
    assert_response :success
  end
end
