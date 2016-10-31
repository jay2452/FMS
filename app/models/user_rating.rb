class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :user_id, presence: true
  validates :subject_id, presence: true
  validates :month_no, presence: true
  validates :year, presence: true
  validates :rating_given, presence: true
end
