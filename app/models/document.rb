class Document < ApplicationRecord

  has_attached_file :document_list,
           styles: { medium: "300x300>", thumb: "100x100>"},
           s3_protocol: 'https'

  validates :document_list,
             presence: true

  validates_attachment_content_type :document_list, :content_type => ['image/jpeg', 'image/png']
  validates :document_list, attachment_presence: true

end
