require 'rspec/core/rake_task'

require File.expand_path('../../env', __FILE__)

desc "Run puppet module RSpec tests, report=ci optional"
RSpec::Core::RakeTask.new(:spec) do |t|
  if ENV['report'] == "ci" 
    begin
      require 'ci/reporter/rake/rspec_loader'
    rescue LoadError
      fail 'Cannot load ci_reporter, did you install it?'
    end

    format = "CI::Reporter::RSpec"
    ENV['CI_REPORTS'] = "#{RESULTS}/spec/reports"
  else
    format = "doc"
  end

  if ENV['fail_on_error'] == 'false'
    fail_on_error = false
  else
    fail_on_error = true
  end

  t.rspec_opts = ["--format", "#{format}", "--color"]
  t.fail_on_error = fail_on_error
  t.pattern = 'spec/{classes,defines,functions,hosts}/**/*_spec.rb'
end
