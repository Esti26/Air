require "test_helper"

class WigsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wigs_index_url
    assert_response :success
  end

  test "should get show" do
    get wigs_show_url
    assert_response :success
  end

  test "should get new" do
    get wigs_new_url
    assert_response :success
  end

  test "should get create" do
    get wigs_create_url
    assert_response :success
  end

  test "should get edit" do
    get wigs_edit_url
    assert_response :success
  end

  test "should get update" do
    get wigs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get wigs_destroy_url
    assert_response :success
  end
end
