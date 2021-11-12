require 'test_helper'

class TypeFormatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get type_formats_index_url
    assert_response :success
  end

end
