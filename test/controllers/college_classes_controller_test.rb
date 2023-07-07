require "test_helper"

class CollegeClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @college_class = college_classes(:one)
  end

  test "should get index" do
    get college_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_college_class_url
    assert_response :success
  end

  test "should create college_class" do
    assert_difference("CollegeClass.count") do
      post college_classes_url, params: { college_class: { course_id: @college_class.course_id, day: @college_class.day, end_time: @college_class.end_time, lecturer_id: @college_class.lecturer_id, room_id: @college_class.room_id, start_time: @college_class.start_time } }
    end

    assert_redirected_to college_class_url(CollegeClass.last)
  end

  test "should show college_class" do
    get college_class_url(@college_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_college_class_url(@college_class)
    assert_response :success
  end

  test "should update college_class" do
    patch college_class_url(@college_class), params: { college_class: { course_id: @college_class.course_id, day: @college_class.day, end_time: @college_class.end_time, lecturer_id: @college_class.lecturer_id, room_id: @college_class.room_id, start_time: @college_class.start_time } }
    assert_redirected_to college_class_url(@college_class)
  end

  test "should destroy college_class" do
    assert_difference("CollegeClass.count", -1) do
      delete college_class_url(@college_class)
    end

    assert_redirected_to college_classes_url
  end
end
