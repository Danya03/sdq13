require 'test_helper'

class CalendarOfTheChampionshipsControllerTest < ActionController::TestCase
  setup do
    @calendar_of_the_championship = calendar_of_the_championships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_of_the_championships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_of_the_championship" do
    assert_difference('CalendarOfTheChampionship.count') do
      post :create, calendar_of_the_championship: { country: @calendar_of_the_championship.country, gp_name: @calendar_of_the_championship.gp_name, location: @calendar_of_the_championship.location, number: @calendar_of_the_championship.number, race_date: @calendar_of_the_championship.race_date }
    end

    assert_redirected_to calendar_of_the_championship_path(assigns(:calendar_of_the_championship))
  end

  test "should show calendar_of_the_championship" do
    get :show, id: @calendar_of_the_championship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_of_the_championship
    assert_response :success
  end

  test "should update calendar_of_the_championship" do
    patch :update, id: @calendar_of_the_championship, calendar_of_the_championship: { country: @calendar_of_the_championship.country, gp_name: @calendar_of_the_championship.gp_name, location: @calendar_of_the_championship.location, number: @calendar_of_the_championship.number, race_date: @calendar_of_the_championship.race_date }
    assert_redirected_to calendar_of_the_championship_path(assigns(:calendar_of_the_championship))
  end

  test "should destroy calendar_of_the_championship" do
    assert_difference('CalendarOfTheChampionship.count', -1) do
      delete :destroy, id: @calendar_of_the_championship
    end

    assert_redirected_to calendar_of_the_championships_path
  end
end
