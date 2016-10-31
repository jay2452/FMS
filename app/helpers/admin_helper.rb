module AdminHelper
  def users_not_given_feedback
    arr = []
    UserRating.select('user_id').distinct.each do |user|
      arr << user.user_id
    end

    User.all - User.where("id IN (?)", arr)
  end

  def feed_not_given_in_all_subjects(user)
    a.subjects.select(:id).map(&:id) # => id of all the subjects which the student reads/attends
  end
end
