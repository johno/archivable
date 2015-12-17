require 'active_support/concern'

module Archivable
  module Model
    extend ActiveSupport::Concern

    module ClassMethods
      def archived
        scoped(conditions: { archived: true })
      end

      def unarchived
        scoped(conditions: { archived: false })
      end
    end

    def archived?
      archived
    end

    def archive!(save_args = {})
      self.archived = true
      save(save_args)
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
