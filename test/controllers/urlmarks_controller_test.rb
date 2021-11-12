require 'test_helper'

class UrlmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get urlmarks_index_url
    assert_response :success
  end

end
