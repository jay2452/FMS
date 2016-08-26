class RemoveRatingFromFeedbacks < ActiveRecord::Migration[5.0]
  def change
    remove_column :feedbacks, :rating, :integer
  end
end
