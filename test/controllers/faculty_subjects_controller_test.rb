require 'test_helper'

class FacultySubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faculty_subject = faculty_subjects(:one)
  end

  test "should get index" do
    get faculty_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_faculty_subject_url
    assert_response :success
  end

  test "should create faculty_subject" do
    assert_difference('FacultySubject.count') do
      post faculty_subjects_url, params: { faculty_subject: { faculty_id: @faculty_subject.faculty_id, subject_id: @faculty_subject.subject_id } }
    end

    assert_redirected_to faculty_subject_url(FacultySubject.last)
  end

  test "should show faculty_subject" do
    get faculty_subject_url(@faculty_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_faculty_subject_url(@faculty_subject)
    assert_response :success
  end

  test "should update faculty_subject" do
    patch faculty_subject_url(@faculty_subject), params: { faculty_subject: { faculty_id: @faculty_subject.faculty_id, subject_id: @faculty_subject.subject_id } }
    assert_redirected_to faculty_subject_url(@faculty_subject)
  end

  test "should destroy faculty_subject" do
    assert_difference('FacultySubject.count', -1) do
      delete faculty_subject_url(@faculty_subject)
    end

    assert_redirected_to faculty_subjects_url
  end
end
