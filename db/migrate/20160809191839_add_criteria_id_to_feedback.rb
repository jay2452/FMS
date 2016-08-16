class AddCriteriaIdToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :criteria_id, :integer
  end
end
