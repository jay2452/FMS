class AdminController < ApplicationController
  def index
  end

  def users_list
    @users = User.all
  end

  def subject_import
    Subject.import params[:subject_file]
    redirect_to subjects_path, notice: "Subject Imported"
  end

  def user_import
    User.import params[:user_file]
    redirect_to root_url, notice: "User Imported"
  end


  def user_subject_import
    StudentSubject.import params[:user_subject_file]
    redirect_to student_subjects_path, notice: "User Subject Imported"
  end

  def faculty_subject_import
    FacultySubject.import params[:faculty_subject_file]
    redirect_to faculty_subjects_path, notice: "Faculty Subject Imported !!"
  end
end
