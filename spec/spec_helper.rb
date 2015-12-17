require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'action_controller'

require 'archivable'

class Fake
  include Archivable::Model
  attr_accessor :archived

  def initialize(opts = {})
    self.archived = opts[:archived] || false
  end

  def toggle(dont_care)
    self.archived = archived ? false : true
  end

  def archived?
    !!archived
  end

  def save
    true
  end
end

class UnarchivableFake
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
