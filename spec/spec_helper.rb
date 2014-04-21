require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'archivable'

I18n.enforce_available_locales = false

RSpec.configure do |config|
  config.color_enabled = true
end
