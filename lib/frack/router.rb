module Frack
  class Router
    ROUTES = {
      '/' => 'WelcomeController#index',
      '/users' => 'UsersController#index'
    }

    def initialize(app)
      @app = app
    end

    def call(env)
      if(mapping = ROUTES[env['PATH_INFO']])
        env.merge!(controller_action(mapping))
        @app.call(env)
      else
        Rack::Response.new('Not Found',404)
    end
  end

    def controller_action(mapping)
      Hash[%w(controller application).zip mapping.split('#')]
  end
 end
end
