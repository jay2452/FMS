class FeedFormController < ApplicationController
  before_action :authenticate_user!

  def index
    @criterias = Criterium.all

    @criteria_count = @criterias.count
    @semesters = Semester.all
    @programs = Program.all
    # @subjects = current_user.subjects
    @faculties = Faculty.all

    user_ratings = UserRating.where("user_id = ?", current_user.id)
    s_ids = [] # => contains subject id for which user has given feed back
    user_ratings.each do |user_rating|
      s_ids << user_rating.subject_id
    end

    puts "============================="
      p s_ids
    puts "============================="
    # => fetch all the subjects which the user is allowed to give feedback
    # @subjects = Subject.where.not("id = ?", s_ids) # => it wll show the subjects for which user has not given any review in that month
    @subjects = current_user.subjects - Subject.where("id IN (?)", s_ids)
  end

  def thankyou
  end

  def user_input
    sum = params["sum1"].to_i
    sum = sum/10
    user_id = params["user_id"]
    program_id = params["program_id"]
    subject_id = params["subject_id"]
    semester_id = params["semester_id"]
    faculty_id = params["faculty_id"]
    batch = params["batch"]
    month_no = params["month_no"]
    year = params["year"]

    puts "+++++++++++++++++++++++++++++"

      puts sum
      puts user_id
      puts program_id
      puts subject_id
      puts semester_id
      puts faculty_id
      puts batch
      puts month_no
      puts year

    puts "+++++++++++++++++++++++++++++"


    Feedback.create!(rating: sum, subject_id: subject_id, faculty_id: faculty_id, semester_id: semester_id, program_id: program_id)
    #  to check user has given any rating or nor
    UserRating.create! user_id: user_id, rating_given: true, subject_id: subject_id, month_no: month_no, year: year
  end

  def instruction
    user_ratings = UserRating.where("user_id = ?", current_user.id)
    s_ids = [] # => contains subject id for which user has given feed back
    user_ratings.each do |user_rating|
      s_ids << user_rating.subject_id
    end

    puts "============================="
      p s_ids
    puts "============================="
    # => fetch all the subjects which the user is allowed to give feedback
    # @subjects = Subject.where.not("id = ?", s_ids) # => it wll show the subjects for which user has not given any review in that month
    @subjects = current_user.subjects - Subject.where("id IN (?)", s_ids)
  end

end
