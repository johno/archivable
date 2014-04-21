require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'archivable'

RSpec.configure do |config|
  config.color_enabled = true
end

class FakeModel
  attr_accessor :archived
end

class FakesController
  include Archivable::Controller
end
