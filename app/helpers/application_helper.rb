module ApplicationHelper

  def members_tabs(course)
    Course.all.map(&:name).each do |course_name|
      course.item course_name, course_name, admin_members_path(course: course_name),
        highlights_on: lambda { params[:course] == course_name }
    end
  end

  def custom_navigation
    'navbar-navbar-default.custom-nav' 
  end

  def is_pdf_request?
    params[:format] == 'pdf'
  end

end
