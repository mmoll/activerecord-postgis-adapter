# frozen_string_literal: true

namespace :db do
  namespace :gis do
    desc "Setup PostGIS data in the database"
    task setup: [:load_config] do
      environments = [Rails.env]
      environments << "test" if Rails.env.development?
      environments.each do |environment|
        ActiveRecord::Base.configurations
          .configs_for(env_name: environment)
          .reject { |env| env.config["database"].blank? }
          .each do |env|
            if ActiveRecord::VERSION::MAJOR == 6 && ActiveRecord::VERSION::MINOR >= 1
              ActiveRecord::ConnectionAdapters::PostGIS::PostGISDatabaseTasks.new(env).setup_gis
            else
              ActiveRecord::ConnectionAdapters::PostGIS::PostGISDatabaseTasks.new(env.config).setup_gis
            end
          end
      end
    end
  end
end
