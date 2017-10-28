class CreateViewCertificateGeneral < ActiveRecord::Migration[5.0]

  def up
    execute(
      <<-SQL
        CREATE OR REPLACE VIEW view_certificate_general AS
          SELECT 
            m.id,
            c.name AS course_name,
            c.interval AS course_duration,
            m.fees,
            m.created_at AS course_initiated,
            CONCAT(a.first_name, ' ', a.last_name ) AS member_name,
            m.certificategenerated
          FROM  courses c
          INNER JOIN course_members cm ON cm.id = c.id
          INNER JOIN members m ON m.id = cm.id
          INNER JOIN addresses a ON a.resource_id = m.id
          where m.certificategenerated IS TRUE
      SQL
    )
  end

  def down

  end

end
