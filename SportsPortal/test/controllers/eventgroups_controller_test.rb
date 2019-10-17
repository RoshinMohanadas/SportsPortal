require 'test_helper'

class EventgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventgroup = eventgroups(:one)
  end

  test "should get index" do
    get eventgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_eventgroup_url
    assert_response :success
  end

  test "should create eventgroup" do
    assert_difference('Eventgroup.count') do
      post eventgroups_url, params: { eventgroup: { description: @eventgroup.description, enddate: @eventgroup.enddate, isactive: @eventgroup.isactive, name: @eventgroup.name, regenddate: @eventgroup.regenddate, regstartdate: @eventgroup.regstartdate, startdate: @eventgroup.startdate, venue: @eventgroup.venue } }
    end

    assert_redirected_to eventgroup_url(Eventgroup.last)
  end

  test "should show eventgroup" do
    get eventgroup_url(@eventgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventgroup_url(@eventgroup)
    assert_response :success
  end

  test "should update eventgroup" do
    patch eventgroup_url(@eventgroup), params: { eventgroup: { description: @eventgroup.description, enddate: @eventgroup.enddate, isactive: @eventgroup.isactive, name: @eventgroup.name, regenddate: @eventgroup.regenddate, regstartdate: @eventgroup.regstartdate, startdate: @eventgroup.startdate, venue: @eventgroup.venue } }
    assert_redirected_to eventgroup_url(@eventgroup)
  end

  test "should destroy eventgroup" do
    assert_difference('Eventgroup.count', -1) do
      delete eventgroup_url(@eventgroup)
    end

    assert_redirected_to eventgroups_url
  end
end
