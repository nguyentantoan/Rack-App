$LOAD_PATH << '.'
require 'rack'
require 'tilt'
require 'byebug'
require'lib/frack'
require'app/controllers/users_controller'
require'app/controllers/welcomes_controller'
require'app/models/user'

use Rack::Static,root:'public',urls:['/images','/js','/css']
use Rack::CommonLogger
use Rack::ContentLength
use Frack::Router
run Frack::Application
