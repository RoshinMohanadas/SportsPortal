require 'test_helper'

class EditcontentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editcontent = editcontents(:one)
  end

  test "should get index" do
    get editcontents_url
    assert_response :success
  end

  test "should get new" do
    get new_editcontent_url
    assert_response :success
  end

  test "should create editcontent" do
    assert_difference('Editcontent.count') do
      post editcontents_url, params: { editcontent: { about: @editcontent.about, contact: @editcontent.contact, facilities: @editcontent.facilities, welcometext: @editcontent.welcometext } }
    end

    assert_redirected_to editcontent_url(Editcontent.last)
  end

  test "should show editcontent" do
    get editcontent_url(@editcontent)
    assert_response :success
  end

  test "should get edit" do
    get edit_editcontent_url(@editcontent)
    assert_response :success
  end

  test "should update editcontent" do
    patch editcontent_url(@editcontent), params: { editcontent: { about: @editcontent.about, contact: @editcontent.contact, facilities: @editcontent.facilities, welcometext: @editcontent.welcometext } }
    assert_redirected_to editcontent_url(@editcontent)
  end

  test "should destroy editcontent" do
    assert_difference('Editcontent.count', -1) do
      delete editcontent_url(@editcontent)
    end

    assert_redirected_to editcontents_url
  end
end
