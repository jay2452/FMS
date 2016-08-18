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

  def instruction
  end

end
