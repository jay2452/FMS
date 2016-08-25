class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
    @subjects = Subject.all
    @faculties = Faculty.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  def faculty
    @faculty = Faculty.find_by_id(params[:faculty])
    @fac_feedbacks = Feedback.where("faculty_id = ?", @faculty.id).select(:faculty_id, :subject_id, :month_no, :year).distinct  # list of feedbacks for a particular faculty

    puts "==================="
    months = @fac_feedbacks.select(:month_no, :year).distinct
    arr = []
    months.each do |month|
      arr << month.month_no
    end
    
    p arr.uniq
    puts "==================="
    # @total_rating = 0
    # arr = []
    #
    # @fac_feedbacks.each do |feed|
    #   rating = 0
    #   @total_rating += feed.rating
    #
    #   @fac_feedbacks.where("subject_id = ?", feed.subject_id).each do |rate|
    #     rating += rate.rating
    #   end
    #   puts "++++++++++++++++++++"
    #     puts rating
    #   puts "+++++++++++++++++++++"
    #
    #   arr << feed.subject.id # => contains the subject ids of feedback given
    #
    # end

    # calculate the number of times each subject came
    # arr.uniq!
    # puts "==================="
    #   p arr
    # puts "==================="

    # @fac_feedbacks_uniq = ("subject_id IN (?)", arr)
    # arr.each do |item|
    #   sub_count = number_frequency(arr, item) # => number of times feedback was given to a particular subject
    # end

  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new

  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:criteria_id, :rating)
    end
end
