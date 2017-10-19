class Admin::MembersController < AdminController

  before_action :find_course

  def index
    @members = @course.try(:members)
  end

  def new
    @member = @course.members.build
    @address = @member.build_address
  end

  def create
    @member = @course.members.new(member_params)
    if @course.save && @member.save
      respond_to do |format|
        format.js
      end
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
