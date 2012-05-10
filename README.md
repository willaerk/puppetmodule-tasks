Puppet Module Rake Tasks
========================

A collection of rake tasks to perform a number of standard procedures on puppet modules. In keeping with the [DRY](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principle, they were factored out of existing puppet modules into this repository.  

Installation
------------

The easiest way to install these tasks, is to add this repository as a git submodule in your puppet module source tree. This basically means you run these commands in your module source tree toplevel dir:

    git submodule add git://github.com/willaerk/puppetmodule-tasks.git tasks
    git commit -m 'Added submodule tasks'

When you clone a project with a submodule in it, you need to run the following commands:

    git clone git://github.com/willaerk/puppet-users.git
    git submodule init
    git submodule update

The tasks should preferably be loaded from a top-level `Rakefile`:

```ruby
require 'rubygems'
require 'rake'

task_dir = File.expand_path("../tasks", __FILE__)

FileList["#{task_dir}/**/*.rake"].each { |fn| load fn }

desc "Default task prints the available targets."
task :default do
  sh %{rake -T}
end
```

Usage
-----

Using the above `Rakefile`, you can just run `rake` to display the available targets. Several of them require extra gems. There is a `Gemfile` included, which lists the necessary dependencies. To install these, just run the following from the submodule topdir (you need the `bundler` gem for this):

    bundle install

Note there is no `puppet` gem included in the `Gemfile`, since a lot of people already have Puppet installed (using distribution packages). So you need to install Puppet yourself (gem or package). If you don't know how to do that, you shouldn't be here anyway :)

Copyright
---------

Copyright (c) 2012 Kristof Willaert

License
-------

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
