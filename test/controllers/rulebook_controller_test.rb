require 'test_helper'

class RulebookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rulebook_index_url
    assert_response :success
  end

end
