class Feedback < ApplicationRecord
  belongs_to :subject
  belongs_to :faculty
  belongs_to :semester
  belongs_to :program
end
