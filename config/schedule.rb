set :output, {:error => 'error.log', :standard => 'cron.log'}
every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  rake "generate_certificate:generate_data"
end