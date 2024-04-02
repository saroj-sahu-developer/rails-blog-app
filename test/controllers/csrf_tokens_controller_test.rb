require "test_helper"

class CsrfTokensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csrf_tokens_index_url
    assert_response :success
  end
end
