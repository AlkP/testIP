# vim:fileencoding=utf-8

require 'json'
require 'yaml'
require 'resque'

redis_env_var = ENV['REDIS_PROVIDER'] || 'REDIS_URL'
Resque.redis = ENV[redis_env_var] || 'localhost:6379'

require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

