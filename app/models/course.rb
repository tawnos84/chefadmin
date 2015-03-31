class Course < ActiveRecord::Base
  belongs_to :menu

  default_scope -> { order(position: :asc) }

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
