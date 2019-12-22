$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'rack'
require 'tilt'

ENV['APP_ENV'] || 'development'
require 'active_record'
require 'erb'
require_relative '../config/database'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end
