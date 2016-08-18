class AdminController < ApplicationController
  def index
  end

  def users_list
    @users = User.all
  end

  def subject_import
    Subject.import params[:file]
    redirect_to subjects_path, notice: "Subject Imported"
  end

  def user_import
    User.import params[:file]
    redirect_to root_url, notice: "User Imported"
  end
end
