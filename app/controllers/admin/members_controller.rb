class Admin::MembersController < AdminController

  before_action :find_course

  def index
    @members = @course.try(:members)
  end

  def new
    @member = @course.members.build
    @member.course_duration = @course.interval
    @address = @member.build_address
  end

  def create
    @member = @course.members.new(member_params)
    if @course.save && @member.save
      respond_to do |format|
        flash[:notice] = 'Member is created successfully'
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
        flash[:notice] = 'Member is destroyed successfully'
        redirect_to admin_members_path(course: params[:course])
    else
      render 'new'
    end
  end


  private

  def find_course
    @course = Course.find_by_name(params[:course])
  end

  def member_params
    params.require(:member).permit(
      :fees,
      :course_duration,
      address_attributes:
      [
        :first_name,
        :middle_name,
        :last_name,
        :email_id,
        :mobile_number
      ]
    )
  end

end
