class FacultySubject < ApplicationRecord
  belongs_to :subject
  belongs_to :faculty
end
