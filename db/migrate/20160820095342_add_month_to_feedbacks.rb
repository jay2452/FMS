class AddMonthToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :month_no, :integer
    add_column :feedbacks, :year, :integer
    remove_column :feedbacks, :month, :date
  end
end
