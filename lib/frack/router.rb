module Frack
  class Router
    attr_reader :app

    ROUTES = [
      {
        request_method: 'get',
        request_path: '/',
        mapping: 'WelcomeController'
      },
      {
        request_method: 'get',
        request_path: '/users',
        mapping: 'UsersController#index'
      },
      {
        request_method: 'get',
        request_path: '/sign_up',
        mapping: 'UsersController#new'
      },
      {
        request_method: 'post',
        request_path: '/sign_up',
        mapping: 'UsersController#create'
      }
    ]

    def initialize(app)
      @app = app
     end

    def call(env)
      if(mapping = ROUTES[env['PATH_INFO']])
        env.merge!(controller_action(mapping))

        route = routes.find do |r|
          r[:request_method] == env['REQUEST_METHOD']  &&
          r[:request_path] == env['PATH_INFO']
        end

          if route
            env.merge!(controller_action(route))
            @app.call(env)
      else
        Rack::Response.new('Not Found',404)
      end
    end

    def controller_action(mapping)
      Hash[%w(controller action).zip mapping.split('#')]
    end
  end
end
