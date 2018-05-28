require 'httparty'
require 'rspec'
require 'pry'
require 'json-schema'

# Environment definitions
$env = ENV['ENV'] || 'MOCK'
ENVIRONMENT = (YAML.load_file('./config/environment.yml'))[$env]

#Fixtures
AUTH = (YAML.load_file('./config/authentication.yml'))[$env]