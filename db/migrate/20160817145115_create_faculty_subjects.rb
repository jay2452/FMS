class CreateFacultySubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :faculty_subjects do |t|
      t.references :subject, foreign_key: true
      t.references :faculty, foreign_key: true

      t.timestamps
    end
  end
end
