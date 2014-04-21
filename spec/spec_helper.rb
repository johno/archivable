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
  include ActionController::MimeResponds
  include Archivable::Controller

  attr_accessor :request

  @_response = ActionDispatch::Response.new

  def initialize
    @request = FakeRequest.new
  end

  def set_fake
    @fake = Fake.new
  end

  def render(dont_care, also_dont_care = {})
  end

  def head(status, options = {})
  end

  def dispatch(action, request)

  end

  def get_fake
    @fake
  end
end

# Thanks to Mislav
# https://github.com/mislav/will_paginate/blob/master/spec/view_helpers/action_view_spec.rb
class FakeRequest
  attr_accessor :symbolized_path_parameters
  
  def initialize
    @get = true
    @params = {}
    @symbolized_path_parameters = { :controller => 'foo', :action => 'bar' }
  end
  
  def negotiate_mime(order)
    Mime::HTML
  end

  def get?
    @get
  end

  def post
    @get = false
  end

  def relative_url_root
    ''
  end
  
  def script_name
    ''
  end

  def accept
    [Mime::HTML, Mime::JS]
  end

  def params(more = nil)
    @params.update(more) if more
    @params
  end
  
  def host_with_port
    'example.com'
  end
  alias host host_with_port

  def optional_port
    ''
  end
  
  def protocol
    'http:'
  end
end
