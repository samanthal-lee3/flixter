class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]


  def show
  end

  private

  def require_authorized_for_current_lesson
    if current_user != enrolled_in?(current_lesson)
      redirect_to course_path, alert: 'You must enroll to view lesson details'
    end
  end

  helper_method :current_lesson
  helper_method :current_user
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def current_user
    @current_user ||= User.find(params[:id])
  end

end

