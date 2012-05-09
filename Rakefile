#!/usr/bin/env rake
ENV['position_in_class']   = "before"
ENV['position_in_fixture'] = "before"
ENV['show_indexes']        = "true"
ENV['include_version']     = "true"
ENV['exclude_tests']       = "false"
ENV['exclude_fixtures']    = "false"
ENV['skip_on_db_migrate']  = "false"

require File.expand_path('../config/application', __FILE__)
require 'annotate/tasks'

Sandwichshop::Application.load_tasks
