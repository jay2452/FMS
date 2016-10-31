class Feedback < ApplicationRecord
  belongs_to :subject
  belongs_to :faculty
  belongs_to :semester
  belongs_to :program

  validates :subject_id, presence: true
  validates :faculty_id, presence: true
  validates :semester_id, presence: true
  validates :program_id, presence: true
  validates :month_no, presence: true
  validates :year, presence: true
  validates :rating, presence: true
end
