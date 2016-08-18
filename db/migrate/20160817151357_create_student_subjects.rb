class CreateStudentSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :student_subjects do |t|
      t.integer :student_id
      t.integer :section_id
      t.integer :semester_id
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
