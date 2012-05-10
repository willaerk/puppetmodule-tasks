# This file contains the environment configuration shared by all
# tasks. It should be required at the top of each *.rake file with:
#
# require File.expand_path('../../env', __FILE__)

# Sync all stdout/stderr to play nice with buildtools
# running the rake tasks.
$stdout.sync = true
$stderr.sync = true

# Basedir for all output.
RESULTS = ENV['results'] || "results"
