class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  self.use_transactional_fixtures = false

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

end
