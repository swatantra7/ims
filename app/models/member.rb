class Member < ApplicationRecord

  has_one :address, as: :resource, dependent: :destroy
  has_many :course_members
  has_many :courses, through: :course_members

  delegate :first_name, to: :address, allow_nil: true
  delegate :middle_name, to: :address, allow_nil: true
  delegate :last_name, to: :address, allow_nil: true
  delegate :email_id, to: :address, allow_nil: true
  delegate  :interval, to: :courses
  delegate  :mobile_number, to: :address, allow_nil: true

  accepts_nested_attributes_for :address

  attr_reader :course

  scope :certificate_not_generated, -> { where( certificategenerated: false ) }

  def name
    full_name = ''
    full_name << first_name.to_s << middle_name.to_s << last_name.to_s
    full_name
  end

  def generate_certificate!
    if course_completed?
      self.update_attribute(:certificategenerated, true)
    end
  end

  def course_completed?
    (((Time.now - self.created_at)/1.day).round).to_i >=  self.course_duration*30
  end 

end