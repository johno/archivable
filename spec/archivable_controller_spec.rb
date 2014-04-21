require 'spec_helper'

describe Archivable::Controller do

  subject { FakesController.new }

  it { should respond_to(:archive) }
end
