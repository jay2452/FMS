module AdminHelper

  def users_not_given_feedback
    arr = []
    UserRating.select('user_id').distinct.each do |user|
      arr << user.user_id
    end

    User.all - User.where("id IN (?)", arr)
  end

end
