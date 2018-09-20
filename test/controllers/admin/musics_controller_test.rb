require 'test_helper'

class Admin::MusicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_musics_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_musics_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_musics_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_musics_edit_url
    assert_response :success
  end

end
