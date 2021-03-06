class CoursesController < ApplicationController
  layout "admin", only: [:index]

  def index
    @menu = Menu.find(params[:menu_id])
    @courses = @menu.courses.all
  end

  def new
    @course = Course.new
    @menu = Menu.find(params[:menu_id])
  end

  def edit
    @menu = Menu.find(params[:menu_id])
    @course = @menu.courses.find(params[:id])
  end

  def show
  end

  def update
    @menu = Menu.find(params[:menu_id])
    @course = @menu.courses.find(params[:id])

    if @course.update(course_params)
      redirect_to chef_menu_courses_url
    else
      render 'new'
    end
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @course = @menu.courses.create(course_params)

    if @course.save
      redirect_to chef_menu_courses_url
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to chef_menu_courses_path
  end

  private
  def course_params
    params.require(:course).permit(:name, :position, :menu_id, :type, :description, :course_type)
  end
end
