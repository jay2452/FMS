class AddRatingToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :rating, :double
  end
end
