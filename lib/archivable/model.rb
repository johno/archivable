require 'active_support/concern'

module Archivable
  module Model
    extend ActiveSupport::Concern

    def archived?
      archived
    end

    def archive!
      self.archived = true
      save
    end

    def unarchive!
      self.archived = false
      save
    end

    def is_archivable?
      respond_to?(:archived)
    end
  end
end
