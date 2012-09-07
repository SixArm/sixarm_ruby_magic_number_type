# -*- coding: utf-8 -*-
Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_magic_number_type"
  s.summary           = "SixArm.com » Ruby » Magic number type inspects bytes to decide on a mime type"
  s.version           = "1.2.0"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  CLASSES             = []
  TESTERS             = [
                         'sample.fit',
                         'sample.gif',
                         'sample.jpg',
                         'sample.png',
                         'sample.ps',
                         'sample.ras',
                         'sample.sgi',
                         'sample.tiff',
                         'sample.xcf.bz2',
                         'sample.xcf.gz'
                       ]

  top_files           = [".gemtest", "Rakefile", "README.md", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"]
  test_files          = [] #"test/#{s.name}_test.rb"] + TESTERS.map{|x| "test/#{s.name}_test/#{x}_test.rb"} +

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

end
