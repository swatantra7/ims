class Course < ApplicationRecord

  validates :name, 
            :interval,
            presence: true

  validates :name,
            uniqueness: true

  has_many :course_members
  has_many :members, through: :course_members

  accepts_nested_attributes_for :members

end
