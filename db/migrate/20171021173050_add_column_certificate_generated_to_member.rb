class AddColumnCertificateGeneratedToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :certificategenerated, :boolean, default: false
    add_column :members, :course_duration, :integer
  end
end
