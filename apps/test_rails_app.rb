require 'action_controller/railtie'

module TestRailsApp
  class Application < Rails::Application
    config.secret_key_base = '6dfb795086781f017c63cadcd2653fac40967ac60f621e6299a0d6d811417156d81efcdf1d234c'

    routes.draw do
      get '/posts' => 'test_rails_app/posts#index'
    end
  end

  class PostsController < ActionController::Base
    def index
      head :ok
    end
  end
end

Rails.logger = Logger.new('test.log')