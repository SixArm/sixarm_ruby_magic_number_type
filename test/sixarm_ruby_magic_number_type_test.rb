# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
])
SimpleCov.start
require "sixarm_ruby_magic_number_type"

