class AddChangesToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_reference :feedbacks, :subject, foreign_key: true
    add_reference :feedbacks, :faculty, foreign_key: true
    add_reference :feedbacks, :semester, foreign_key: true
    add_reference :feedbacks, :program, foreign_key: true
    add_column :feedbacks, :month, :date
  end
end
