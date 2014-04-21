require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'action_controller'

require 'archivable'

RSpec.configure do |config|
  config.color_enabled = true
end

class Fake
  attr_accessor :archived

  def toggle(dont_care)
    self.archived = archived ? false : true
  end

  def save
    true
  end
end

class FakesController < ActionController::Base
  include Archivable::Controller

  def set_fake
    @fake = Fake.new
  end

  def render(dont_care, also_dont_care = {})
  end

  def get_fake
    @fake
  end
end
