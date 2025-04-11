require "test_helper"

class GamehubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamehub_index_url
    assert_response :success
  end
end
