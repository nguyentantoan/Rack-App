$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))
require 'rack'
require 'tilt'

ENV['APP_ENV'] || 'development'
require 'active_record'
require 'erb'
require_relative '../config/database'

require 'app/models/user'
require 'app/models/category'
require 'app/models/order'
require 'app/models/product'
require 'app/models/order_detail'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end

require 'app/controllers/users_controller.rb'
require 'app/controllers/welcomes_controller'
