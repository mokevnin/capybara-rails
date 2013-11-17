class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def saop
    save_and_open_page
  end

  def assert_response(type)
    result = page.status_code == Rack::Utils::SYMBOL_TO_STATUS_CODE[type]
    assert result, ("Expected response to be a %s, but was %s" % [type, page.status_code])
  end
end
