module ApplicationHelper

  def calc_rating(feedback)
    faculty_id = feedback.faculty_id
    subject_id = feedback.subject_id
    month = feedback.month_no
    year = feedback.year

    @feeds = Feedback.where("faculty_id = ? AND subject_id = ? AND month_no = ? AND year = ?", faculty_id, subject_id, month, year)
    rate = 0
    count = 0
    @feeds.each do |feed|
      rate += feed.rating
      count += 1
    end
    return (rate/count).to_f
  end

  def number_frequency(arr, number)
    count = 0
  	arr.each do |n|
  		if n == number
  			count += 1
  		end
  	end
  	puts count
    return count
  end

  def fac_rating_in_subject(fac_id, subject_id)

  end

  def get_month_from_no month
    if month == 1
      "January"
    elsif month == 2
      "February"
    elsif month == 3
      "March"
    elsif month == 4
      "April"
    elsif month == 5
      "May"
    elsif month == 6
      "June"
    elsif month == 7
      "July"
    elsif month == 8
      "August"
    elsif month == 9
      "September"
    elsif month == 10
      "October"
    elsif month == 11
      "November"
    elsif month == 12
      "December"
    end
  end
end
