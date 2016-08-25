class UserSectionsController < ApplicationController
  before_action :set_user_section, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /user_sections
  # GET /user_sections.json
  def index
    @user_sections = UserSection.all
  end

  # GET /user_sections/1
  # GET /user_sections/1.json
  def show
  end

  # GET /user_sections/new
  def new
    @user_section = UserSection.new
  end

  # GET /user_sections/1/edit
  def edit
  end

  # POST /user_sections
  # POST /user_sections.json
  def create
    @user_section = UserSection.new(user_section_params)
    user_roll = @user_section.user_id
    user_id = User.find_by_roll(user_roll).id
    @user_section.user_id = user_id

    respond_to do |format|
      if @user_section.save
        format.html { redirect_to @user_section, notice: 'User section was successfully created.' }
        format.json { render :show, status: :created, location: @user_section }
      else
        format.html { render :new }
        format.json { render json: @user_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_sections/1
  # PATCH/PUT /user_sections/1.json
  def update
    respond_to do |format|
      if @user_section.update(user_section_params)
        format.html { redirect_to @user_section, notice: 'User section was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_section }
      else
        format.html { render :edit }
        format.json { render json: @user_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sections/1
  # DELETE /user_sections/1.json
  def destroy
    @user_section.destroy
    respond_to do |format|
      format.html { redirect_to user_sections_url, notice: 'User section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_section
      @user_section = UserSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_section_params
      params.require(:user_section).permit(:user_id, :section_id)
    end
end
