class Course < ActiveRecord::Base
  belongs_to :menu

  validates :name, presence: true

  def create
    course = Course.new(course_params)

    course.save
    redirect_to @course
  end

  private
  def course_params
    params.require(:course).permit(:name, :position, :description, :menu_id, :course_type)
  end
end
