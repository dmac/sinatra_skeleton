require "sequel"
require "pathological"
require "environment"

# Timestamp all models with created_at and updated_at.
Sequel::Model.plugin :timestamps

DB = Sequel.postgres(:host => DB_HOST, :user => DB_USER, :password => DB_PASS, :database => DB_NAME)

model_files = Dir[File.join(File.dirname(File.dirname(__FILE__)), "models") + "/*.rb"]
model_files.each { |file| require file }
