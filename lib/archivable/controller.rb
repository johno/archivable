require 'active_support/concern'
require 'meta_magic'

module Archivable
  module Controller
    include MetaMagic::Controller
    extend ActiveSupport::Concern

    def archive
      set_model_instance_variable
      get_model_instance_variable.toggle(:archived)

      if get_model_instance_variable.save
        render :show, notice: "#{ controller_name.classify.humanize } was archived successfully."
      else
        render :show, alert: "#{ controller_name.classify.humanize } wasn't archived successfully."
      end
    end
  end
end
