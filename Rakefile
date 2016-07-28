require './config/environment'

namespace :db do
  desc "migrate your database"
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate')
    update_schema_file
  end

  task :rollback do
    ActiveRecord::Migrator.rollback('db/migrate')
    update_schema_file
  end

  task :should_migrate do
    puts ActiveRecord::Migrator.needs_migration?(ActiveRecord::Base.connection)
  end
end

def update_schema_file
  File.open('db/schema.rb', "w:utf-8") do |file|
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
  end
end
