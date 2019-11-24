module Frack
  class Router
    ROUTES ={
      '/'=>'WelcomeController#index'
      '/users'=>'UsersController#index'
    }
    def initialize(app)
      @app = app
    end

    def call(env)
      if(mapping = ROUTES[env['PATH_INFO']])
      else
        Rack::Response.new('Not Found',404)
    end
  end
