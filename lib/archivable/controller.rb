require 'active_support/concern'
require 'meta_magic'

module Archivable
  module Controller
    include MetaMagic::Controller
    extend ActiveSupport::Concern

    def archive
      archivable_model = set_model_instance_variable
      archivable_model.toggle(:archived)

      if archivable_model.save
        redirect_to action: :show
      else
        render :edit
      end
    end

    def archived
      assign_models_instance_variable_array.archived
      render :index
    end

    def get_archivable_flash(model, opts = {})
      "#{ model.class.name } was"\
      "#{ ' not' unless opts[:success] } "\
      "#{ model.archived ? :archived : :unarchived } "\
      "successfully."
    end
  end
end
