require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get addresses_update_url
    assert_response :success
  end

  test "should get create" do
    get addresses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get addresses_destroy_url
    assert_response :success
  end

end