module Capybara
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "capybara-rails.configure_rails_initialization" do |app|
        unless app.config.action_dispatch.show_exceptions
          raise "[set up config.action_dispatch.show_exceptions to true in environments/test.rb]"
        end

        require 'capybara/rails'

        require 'database_cleaner'
        DatabaseCleaner.strategy = :truncation

        require 'capybara-rails/active_support_test_case'
        if defined?(ActionDispatch::Integration)
          require 'capybara-rails/action_dispatch_integration'
        end

        require 'exception_notification'

        exception_logger = Logger.new('log/capybara_exceptions.log')
        ExceptionNotifier.add_notifier :capybara_exceptions,
          ->(exception, options) {
            exception_logger.debug(exception.message)
            cleaned_backtrace = ::Rails.backtrace_cleaner.clean(exception.backtrace)
            exception_logger.debug(cleaned_backtrace)
          }

        app.middleware.use ExceptionNotification::Rack
      end
    end
  end
end
