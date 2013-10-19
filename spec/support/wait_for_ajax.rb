def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    until page.evaluate_script('AngularRequestCount') == 0
      sleep 0.1
    end
  end
rescue Capybara::Poltergeist::JavascriptError
  # Some tests don't visit any page
end

RSpec.configure do |config|
  config.after :each, type: :feature do
    wait_for_ajax
  end
end
