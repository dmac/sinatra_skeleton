require "sequel"
require "pathological"
require "environment"

class Sequel::Model
  def before_create
    now = Time.now
    self.created_at ||= now if self.columns.include?(:created_at)
    self.updated_at = now if self.columns.include?(:updated_at)
    super
  end

  def after_save
    super
    self.updated_at = Time.now if self.columns.include?(:updated_at)
  end
end

DB = Sequel.postgres(:host => DB_HOST, :user => DB_USER, :password => DB_PASS, :database => DB_NAME)

model_files = Dir[File.join(File.dirname(File.dirname(__FILE__)), "models") + "/*.rb"]
model_files.each { |file| require file }
