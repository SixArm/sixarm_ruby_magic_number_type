# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start

['file','io','string'].map{|x|
  require "sixarm_ruby_magic_number_type_test/#{x}_test.rb"
}

