$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))

require 'dotenv/load'
require 'rack'
require 'tilt'
require 'bcrypt'

ENV['APP_ENV'] || 'development'
require 'active_record'
require 'action_mailer'
ActionMailer::Base.prepend_view_path(File.expand_path('../app/views/', __dir__))

require "letter_opener"
ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, :location => File.expand_path('../tmp/letter_opener', __FILE__)
ActionMailer::Base.delivery_method = :letter_opener

require 'app/mailers/application_mailer.rb'
require 'app/mailers/user_mailer.rb'

ActiveRecord::Base.logger = Logger.new(STDOUT)
require 'erb'
require_relative '../config/database'

require 'app/validators/category_validator.rb'
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
require 'app/controllers/products_controller'
