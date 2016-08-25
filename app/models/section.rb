class Section < ApplicationRecord

  has_many :users, through: :user_section
  has_many :user_sections

  has_many :subjects, through: :student_subjects
  has_many :student_subjects
end
