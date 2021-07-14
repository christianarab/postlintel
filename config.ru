# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
Rails.application.config.active_record.belongs_to_required_by_default = false