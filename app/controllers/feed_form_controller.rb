class FeedFormController < ApplicationController
  before_action :authenticate_user!
  before_action :check_month_year
  before_action :check_sign_in_count

  def index

    @criterias = Criterium.all

    @criteria_count = @criterias.count
    @semesters = Semester.all
    @programs = Program.all
    # @subjects = current_user.subjects
    @faculties = Faculty.all

    user_ratings = UserRating.where("user_id = ? AND month_no = ? AND year = ?", current_user.id, @current_month, @current_year)
    s_ids = [] # => contains subject id for which user has given feed back
    user_ratings.each do |user_rating|
      s_ids << user_rating.subject_id
    end

    puts "============================="
      p s_ids
    puts "============================="
    # => fetch all the subjects which the user is allowed to give feedback
    # @subjects = Subject.where.not("id = ?", s_ids) # => it wll show the subjects for which user has not given any review in that month
    @subjects = current_user.subjects - current_user.subjects.where("subject_id IN (?)", s_ids)
  end

  def thankyou
  end

  def user_input
    sum = params["sum1"].to_f
    sum = sum/10.0
    user_id = params["user_id"]
    program_id = params["program_id"]
    subject_id = params["subject_id"]
    semester_id = params["semester_id"]
    faculty_id = params["faculty_id"]
    batch = params["batch"]
    month_no = params["month_no"]
    year = params["year"]
    #
    # puts "+++++++++++++++++++++++++++++"
    #
    #   puts sum
    #   puts user_id
    #   puts program_id
    #   puts subject_id
    #   puts semester_id
    #   puts faculty_id
    #   puts batch
    #   puts month_no
    #   puts year
    #
    # puts "+++++++++++++++++++++++++++++"

    @feedback = Feedback.new(rating: sum, subject_id: subject_id, faculty_id: faculty_id, semester_id: semester_id, program_id: program_id, month_no: month_no, year: year)
    #Feedback.create!(rating: sum, subject_id: subject_id, faculty_id: faculty_id, semester_id: semester_id, program_id: program_id, month_no: month_no, year: year)
      #  to check user has given any rating or nor
    if @feedback.save
      UserRating.create! user_id: user_id, rating_given: true, subject_id: subject_id, month_no: month_no, year: year
    else
      render json: @feedback.errors.messages
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        p @feedback.errors.messages
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    end
  end

  def instruction

    user_ratings = UserRating.where("user_id = ? AND month_no = ? AND year = ?", current_user.id, @current_month , @current_year)
    s_ids = [] # => contains subject id for which user has given feed back
    user_ratings.each do |user_rating|
      s_ids << user_rating.subject_id
    end

    puts "============================="
      p s_ids
    puts "============================="
    # => fetch all the subjects which the user is allowed to give feedback
    # @subjects = Subject.where.not("id = ?", s_ids) # => it wll show the subjects for which user has not given any review in that month
    @subjects = current_user.subjects - current_user.subjects.where("subject_id IN (?)", s_ids)

  end

  def render_faculty
    sub_id = params["subject_id"].to_i
    puts "--------+++++++++++++++__________________"
     p Subject.find(sub_id).faculties.to_json
    puts "--------+++++++++++++++__________________"

    render json: Subject.find(sub_id).faculties.to_json

  end

  private
    def check_month_year
      a = Time.now
      @current_month = a.month
      @current_year = a.year
    end

    def check_sign_in_count
      # puts "+++++++++++++++++++++"
      # if current_user.sign_in_count < 2
      #   puts "+++++++++++++++++++++"
      #   redirect_to edit_user_registration_path, notice: "Please Change your password"
      # end
    end

end
