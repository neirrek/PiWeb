#
# Switching schedule file
# -----------------------
#
# Each time you modify this file, you have to execute the following
# command in the PiWeb root directory:
#
# wheneverize .
#

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
