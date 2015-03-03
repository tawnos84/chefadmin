class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def edit
  end

  def new
    @course = Course.new
  end

  def show
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end

  private
  def course_params
    params.require(:course).permit(:name, :position, :menu_id, :type, :description)
  end
end
