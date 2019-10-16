require 'test_helper'

class EventGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_group = event_groups(:one)
  end

  test "should get index" do
    get event_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_event_group_url
    assert_response :success
  end

  test "should create event_group" do
    assert_difference('EventGroup.count') do
      post event_groups_url, params: { event_group: { description: @event_group.description, end_date: @event_group.end_date, is_active: @event_group.is_active, name: @event_group.name, reg_end_date: @event_group.reg_end_date, reg_start_date: @event_group.reg_start_date, start_date: @event_group.start_date, venue: @event_group.venue } }
    end

    assert_redirected_to event_group_url(EventGroup.last)
  end

  test "should show event_group" do
    get event_group_url(@event_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_group_url(@event_group)
    assert_response :success
  end

  test "should update event_group" do
    patch event_group_url(@event_group), params: { event_group: { description: @event_group.description, end_date: @event_group.end_date, is_active: @event_group.is_active, name: @event_group.name, reg_end_date: @event_group.reg_end_date, reg_start_date: @event_group.reg_start_date, start_date: @event_group.start_date, venue: @event_group.venue } }
    assert_redirected_to event_group_url(@event_group)
  end

  test "should destroy event_group" do
    assert_difference('EventGroup.count', -1) do
      delete event_group_url(@event_group)
    end

    assert_redirected_to event_groups_url
  end
end
