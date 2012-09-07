# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_magic_number_type'

describe File do

  before do
    SAMPLE_FILE_NAME_TO_MAGIC_NUMBER_TYPE ||= {
      'sample.fit' => :fits,
      'sample.gif' => :gif,
      'sample.html' => :html,
      'sample.xml' => :xml,
      'sample.jpg' => :jpeg,
      'sample.png' => :png,
      'sample.ps' => :postscript,
      'sample.ras' => :sun_rasterfile,
      'sample.sgi' => :iris_rgb,
      'sample.tiff' => :tiff,
      'sample.bz2' => :bzip,
      'sample.gz' => :gzip,
    }
  end

  it "solves the magic number type" do
    SAMPLE_FILE_NAME_TO_MAGIC_NUMBER_TYPE.each_pair{|file_name, type|
      path = File.join("test","sixarm_ruby_magic_number_type_test","samples",file_name)
      File.exist?(path).must_equal true
      File.magic_number_type(path).must_equal type, "Trying #{file_name}"
    }
  end

end

