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
  end
end
