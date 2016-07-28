require './config/environment'

namespace :db do
  desc "migrate your database"
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate')
  end

  task :rollback do
    ActiveRecord::Migrator.rollback('db/migrate')
  end

  task :should_migrate do
    puts ActiveRecord::Migrator.needs_migration?(ActiveRecord::Base.connection)
  end
end
