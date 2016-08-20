module FeedFormHelper

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
