#!/usr/bin/env ruby-local-exec

require "bundler/setup"
require "pathological"
require "environment"

command = "bundle exec sequel -m migrations/"
db_url = "postgres://#{DB_HOST}/#{DB_NAME}"
puts `#{command} #{db_url}`
