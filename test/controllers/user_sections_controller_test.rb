require 'test_helper'

class UserSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_section = user_sections(:one)
  end

  test "should get index" do
    get user_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_user_section_url
    assert_response :success
  end

  test "should create user_section" do
    assert_difference('UserSection.count') do
      post user_sections_url, params: { user_section: { section_id: @user_section.section_id, user_id: @user_section.user_id } }
    end

    assert_redirected_to user_section_url(UserSection.last)
  end

  test "should show user_section" do
    get user_section_url(@user_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_section_url(@user_section)
    assert_response :success
  end

  test "should update user_section" do
    patch user_section_url(@user_section), params: { user_section: { section_id: @user_section.section_id, user_id: @user_section.user_id } }
    assert_redirected_to user_section_url(@user_section)
  end

  test "should destroy user_section" do
    assert_difference('UserSection.count', -1) do
      delete user_section_url(@user_section)
    end

    assert_redirected_to user_sections_url
  end
end
