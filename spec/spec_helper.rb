require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'action_controller'
require 'action_dispatch'

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

  attr_accessor :fake

  def set_fake
    @fake = Fake.new
  end

  def get_fake
    @fake
  end

  def render(dont_care, also_dont_care)
  end

  def redirect_to(dont_care)
  end

  def edit_fake_path(dont_care)
  end
end
