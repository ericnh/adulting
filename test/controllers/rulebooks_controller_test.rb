require 'test_helper'

class RulebooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rulebook = rulebooks(:one)
  end

  test "should get index" do
    get rulebooks_url
    assert_response :success
  end

  test "should get new" do
    get new_rulebook_url
    assert_response :success
  end

  test "should create rulebook" do
    assert_difference('Rulebook.count') do
      post rulebooks_url, params: { rulebook: { major_version: @rulebook.major_version, markdown_text: @rulebook.markdown_text, minor_version: @rulebook.minor_version } }
    end

    assert_redirected_to rulebook_url(Rulebook.last)
  end

  test "should show rulebook" do
    get rulebook_url(@rulebook)
    assert_response :success
  end

  test "should get edit" do
    get edit_rulebook_url(@rulebook)
    assert_response :success
  end

  test "should update rulebook" do
    patch rulebook_url(@rulebook), params: { rulebook: { major_version: @rulebook.major_version, markdown_text: @rulebook.markdown_text, minor_version: @rulebook.minor_version } }
    assert_redirected_to rulebook_url(@rulebook)
  end

  test "should destroy rulebook" do
    assert_difference('Rulebook.count', -1) do
      delete rulebook_url(@rulebook)
    end

    assert_redirected_to rulebooks_url
  end
end
