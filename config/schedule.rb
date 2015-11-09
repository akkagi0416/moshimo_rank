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

set :output, "log/cron.log"
set :environment, :development

# every 4.minute do
every 1.day, at: '2:30 am' do
  rake "moshimo:make_ranking"
end
