class CreateUserRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ratings do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.integer :month_no
      t.integer :year
      t.boolean :rating_given

      t.timestamps
    end
  end
end
