namespace :moshimo_api do
  desc 'test'

  task :aiu => :environment do
    logger = Logger.new('log/moshimo_api.log')
    logger.info('aiu')
    puts 'aiu'
  end
end
