require 'test_helper'

class NotebooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notebooks_index_url
    assert_response :success
  end

  test "should get new" do
    get notebooks_new_url
    assert_response :success
  end

  test "should get update" do
    get notebooks_update_url
    assert_response :success
  end

  test "should get delete" do
    get notebooks_delete_url
    assert_response :success
  end

end
