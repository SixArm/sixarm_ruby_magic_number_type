# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_magic_number_type"
  s.summary        = "SixArm.com → Ruby → Magic number type inspects bytes to decide on a mime type"
  s.description    = "Tool to parse the first bytes of a file and compare it to a list of known mime types."
  s.version        = "3.0.0"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["Apache-2.0", "Artistic-2.0", "BSD-3-Clause", "GPL-2.0", "GPL-3.0", "MIT", "MPL-2.0"]

  s.signing_key    = "/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-private.pem"
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"


  s.files = [
    "Rakefile",
    "lib/sixarm_ruby_magic_number_type.rb",
    "lib/sixarm_ruby_magic_number_type/file.rb",
    "lib/sixarm_ruby_magic_number_type/io.rb",
    "lib/sixarm_ruby_magic_number_type/string.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_magic_number_type_test.rb",
    "test/sixarm_ruby_magic_number_type_test/file_test.rb",
    "test/sixarm_ruby_magic_number_type_test/io_test.rb",
    "test/sixarm_ruby_magic_number_type_test/string_test.rb",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.html",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.xml",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.fit",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.gif",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.jpg",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.png",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.ps",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.ras",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.sgi",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.tiff",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.bz2",
    "test/sixarm_ruby_magic_number_type_test/samples/sample.gz",
  ]

  s.add_development_dependency("minitest", ">= 5.12", "< 6")
  s.add_development_dependency("sixarm_ruby_minitest_extensions", ">= 1.0.8", "< 2")
  s.add_development_dependency("rake", ">= 12.3.3", "< 13")
  s.add_development_dependency("simplecov", ">= 0.18.0", "< 2")
  s.add_development_dependency("flog", ">= 4.6.2", "< 5")
  s.add_development_dependency("flay", ">= 2.12.0", "< 3")
  s.add_development_dependency("reek", ">= 4.8.1", "< 5")
  s.add_development_dependency('rubycritic', '>= 3.4.0', '< 4')
  s.add_development_dependency('rubocop', '>= 0.57.2', '< 1')

  s.required_ruby_version = ">= 2.5"

end
