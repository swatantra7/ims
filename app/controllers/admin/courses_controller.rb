class Admin::CoursesController < AdminController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :interval
    )
  end

end
