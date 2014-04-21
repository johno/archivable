require 'active_support/concern'

module Archivable
  module Model
    extend ActiveSupport::Concern

    included do
      scope :archived,   -> { where(archived: true)  }
      scope :unarchived, -> { where(archived: false) }
    end

    def archived?
      archived
    end
  end
end
