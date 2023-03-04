require 'simplecov'

SimpleCov.start 'rails' do
  minimum_coverage 90
  add_filter %w[app/jobs app/channels]
end
