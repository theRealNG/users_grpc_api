namespace :db do
  desc "migrate your database"
  task :migrate do
    require './config/environment'

    ActiveRecord::Migrator.migrate('db/migrate')
  end
end
