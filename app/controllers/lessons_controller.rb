class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]


  def show
  end

  private

  def require_authorized_for_current_lesson
    @user = User.find(params[:id])
    if @user.enrolled_in?(@course) == false
      redirect_to course_path, alert: 'You must enroll to view lesson details'
    else
      redirect_to lesson_path
    end
  end

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end

