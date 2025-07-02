require "test_helper"

class CharacterRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get character_relationships_show_url
    assert_response :success
  end

  test "should get edit" do
    get character_relationships_edit_url
    assert_response :success
  end

  test "should get update" do
    get character_relationships_update_url
    assert_response :success
  end
end
