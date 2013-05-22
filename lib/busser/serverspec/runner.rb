#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-
#
# Author:: HIGUCHI Daisuke (VDR dai) (<dai@debian.org>)
#
# Copyright (C) 2013, HIGUCHI Daisuke (VDR dai)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'rake/testtask'

abort "usage: #{File.basename($0)} <test_base_path>" if ARGV.first.nil?

base_path = File.expand_path(ARGV.shift)
test_files = ["#{base_path}/**/*_spec.rb", "#{base_path}/**/test_*.rb"]

Rake::TestTask.new(:test) do |t|
  t.libs = []
  t.test_files = FileList[*test_files]
  t.verbose = true
end

Rake::Task["test"].invoke
