class Faculty < ApplicationRecord
  has_many :subjects, through: :faculty_subjects
  has_many :faculty_subjects

  has_many :feedbacks
end
