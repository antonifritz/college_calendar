require "application_system_test_case"

class CollegeClassesTest < ApplicationSystemTestCase
  setup do
    @college_class = college_classes(:one)
  end

  test "visiting the index" do
    visit college_classes_url
    assert_selector "h1", text: "College classes"
  end

  test "should create college class" do
    visit college_classes_url
    click_on "New college class"

    fill_in "Course", with: @college_class.course_id
    fill_in "Day", with: @college_class.day
    fill_in "End time", with: @college_class.end_time
    fill_in "Lecturer", with: @college_class.lecturer_id
    fill_in "Room", with: @college_class.room_id
    fill_in "Start time", with: @college_class.start_time
    click_on "Create College class"

    assert_text "College class was successfully created"
    click_on "Back"
  end

  test "should update College class" do
    visit college_class_url(@college_class)
    click_on "Edit this college class", match: :first

    fill_in "Course", with: @college_class.course_id
    fill_in "Day", with: @college_class.day
    fill_in "End time", with: @college_class.end_time
    fill_in "Lecturer", with: @college_class.lecturer_id
    fill_in "Room", with: @college_class.room_id
    fill_in "Start time", with: @college_class.start_time
    click_on "Update College class"

    assert_text "College class was successfully updated"
    click_on "Back"
  end

  test "should destroy College class" do
    visit college_class_url(@college_class)
    click_on "Destroy this college class", match: :first

    assert_text "College class was successfully destroyed"
  end
end
