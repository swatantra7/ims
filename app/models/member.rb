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
    first_name + '' + middle_name + ''+  last_name if first_name.present? && middle_name.present?
  end

end