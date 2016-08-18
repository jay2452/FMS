class RemoveCriteriaIdFromFeedback < ActiveRecord::Migration[5.0]
  def change
    remove_column :feedbacks, :criteria_id, :integer
  end
end
