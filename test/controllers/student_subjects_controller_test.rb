require 'test_helper'

class StudentSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_subject = student_subjects(:one)
  end

  test "should get index" do
    get student_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_student_subject_url
    assert_response :success
  end

  test "should create student_subject" do
    assert_difference('StudentSubject.count') do
      post student_subjects_url, params: { student_subject: { section_id: @student_subject.section_id, semester_id: @student_subject.semester_id, student_id: @student_subject.student_id, subject_id: @student_subject.subject_id } }
    end

    assert_redirected_to student_subject_url(StudentSubject.last)
  end

  test "should show student_subject" do
    get student_subject_url(@student_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_subject_url(@student_subject)
    assert_response :success
  end

  test "should update student_subject" do
    patch student_subject_url(@student_subject), params: { student_subject: { section_id: @student_subject.section_id, semester_id: @student_subject.semester_id, student_id: @student_subject.student_id, subject_id: @student_subject.subject_id } }
    assert_redirected_to student_subject_url(@student_subject)
  end

  test "should destroy student_subject" do
    assert_difference('StudentSubject.count', -1) do
      delete student_subject_url(@student_subject)
    end

    assert_redirected_to student_subjects_url
  end
end
