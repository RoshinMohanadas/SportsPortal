require 'test_helper'

class NewsfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsfile = newsfiles(:one)
  end

  test "should get index" do
    get newsfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_newsfile_url
    assert_response :success
  end

  test "should create newsfile" do
    assert_difference('Newsfile.count') do
      post newsfiles_url, params: { newsfile: { description: @newsfile.description, title: @newsfile.title } }
    end

    assert_redirected_to newsfile_url(Newsfile.last)
  end

  test "should show newsfile" do
    get newsfile_url(@newsfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsfile_url(@newsfile)
    assert_response :success
  end

  test "should update newsfile" do
    patch newsfile_url(@newsfile), params: { newsfile: { description: @newsfile.description, title: @newsfile.title } }
    assert_redirected_to newsfile_url(@newsfile)
  end

  test "should destroy newsfile" do
    assert_difference('Newsfile.count', -1) do
      delete newsfile_url(@newsfile)
    end

    assert_redirected_to newsfiles_url
  end
end
