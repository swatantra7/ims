namespace :generate_certificate do
  task generate_data: :environment do
    Member.connection
    Member.certificate_not_generated.each do |member|
      member.generate_certificate!
    end
  end

end
