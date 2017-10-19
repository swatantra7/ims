class Member < ApplicationRecord

  has_one :address, as: :resource
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

  def name
    full_name = ''
    full_name << first_name.to_s << middle_name.to_s << last_name.to_s
    full_name
  end

end