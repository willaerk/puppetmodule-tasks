# This file contains the environment configuration shared by all
# tasks. It should be required at the top of each *.rake file with:
#
# require File.expand_path('../../env', __FILE__)

# Sync all stdout/stderr to play nice with buildtools
# running the rake tasks.
$stdout.sync = true
$stderr.sync = true

# Module root directory. Assumes Rakefile is in root directory.
MODULE_ROOT_DIR = File.expand_path(Rake.application.original_dir)

# Basedir for all output.
RESULTS = ENV['results'] || "results"
