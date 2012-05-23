#!/usr/bin/env ruby-local-exec

require "fileutils"

name = ARGV[0]

if name.nil?
  puts "Usage: ruby create_migration name_of_migration"
  exit 1
end

migrations_directory = File.join(File.dirname(File.dirname(__FILE__)), "migrations/")
FileUtils.mkdir_p migrations_directory

timestamp = Time.now.strftime("%Y%m%d%H%M%S") # yyyymmddhhmmss
filename = File.join(migrations_directory, "#{timestamp}_#{name}.rb")

File.open(filename, "w") do |f|
  f.puts <<EOF
Sequel.migration do
  up do
  end

  down do
  end
end
EOF
end

puts filename
