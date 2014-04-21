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
        render :show, notice: get_archivable_flash(get_model_instance_variable, success: true)
      else
        render :show, alert: get_archivable_flash(get_model_instance_variable, success: false)
      end
    end

    def get_archivable_flash(model, opts = {})
      "#{ model.class.name } was"\
      "#{ ' not' unless opts[:success] } "\
      "#{ model.archived ? :archived : :unarchived } "\
      "successfully."
    end
  end
end
