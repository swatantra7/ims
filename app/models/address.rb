class Address < ApplicationRecord

  validates :first_name,
            :last_name,
            presence: true

  validates :mobile_number,
            numericality: true,
            allow_blank: true

  validates :email_id,
          uniqueness: true,
          format: { with: RubyRegex::Email }

end
