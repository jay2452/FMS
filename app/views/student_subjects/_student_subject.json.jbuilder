json.extract! student_subject, :id, :student_id, :section_id, :semester_id, :subject_id, :created_at, :updated_at
json.url student_subject_url(student_subject, format: :json)