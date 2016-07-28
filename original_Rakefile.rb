require './config/environment'

module Rails
  def self.root
    File.dirname(__FILE__)
  end
end

include ActiveRecord::Tasks

db_options = YAML.load(File.read('./config/database.yml'))['development']
puts db_options
DatabaseTasks.env = 'development'
DatabaseTasks.root = File.dirname(__FILE__)
DatabaseTasks.db_dir = './db'
DatabaseTasks.migrations_paths = './db/migrate'

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'
