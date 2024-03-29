Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.test_framework :rspec
  g.fixture_replacement :factory_bot, dir: 'spec/factories'
end
