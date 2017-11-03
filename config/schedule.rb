set :output, {:error => 'error.log', :standard => 'cron.log'}

every 1.day, at: '12:00 am' do
  rake "generate_certificate:generate_data"
end