class CreateFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :faculties do |t|
      t.string :emp_id
      t.string :name

      t.timestamps
    end
  end
end
