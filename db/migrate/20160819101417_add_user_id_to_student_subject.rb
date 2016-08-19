class AddUserIdToStudentSubject < ActiveRecord::Migration[5.0]
  def change
    add_reference :student_subjects, :user, foreign_key: true
    remove_column :student_subjects, :student_id, :integer
  end
end
