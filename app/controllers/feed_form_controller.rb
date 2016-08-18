class FeedFormController < ApplicationController
  before_action :authenticate_user!

  def index
    @criterias = Criterium.all

    @criteria_count = @criterias.count
    @semesters = Semester.all
    @programs = Program.all
    @subjects = Subject.all
    @faculties = Faculty.all
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

    Feedback.create!(rating: sum, subject_id: subject_id, faculty_id: faculty_id, semester_id: semester_id, program_id: program_id)

  end

  def instruction
  end

end
