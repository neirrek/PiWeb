# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Switch on every day at 6:00 am
every :day, :at => '6:00 am' do
  command 'gpio write 0 0'
end

# Switch off every day at 7:00 am
every :day, :at => '7:00 am' do
  command 'gpio write 0 1'
end

# Switch on every day at 8:30 pm
every :day, :at => '8:30 pm' do
  command 'gpio write 0 0'
end

# Switch off every day at 2:00 am
every :day, :at => '2:00 am' do
  command 'gpio write 0 1'
end
