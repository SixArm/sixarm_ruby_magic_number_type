NAME = "sixarm_ruby_magic_number_type"

Gem::Specification.new do |s|

  CLASSES             = []
  TEST_FILES          = [
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

  s.name              = NAME
  s.summary           = "SixArm.com » Ruby » Magic number type inspects bytes to decide on a mime type"
  s.version           = "1.0.0"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ["README.rdoc","LICENSE.txt","lib/#{NAME}.rb"] + CLASSES.map{|c| "lib/#{NAME}/#{c}.rb"} + TEST_FILES.map{|f| "test/#{NAME}/#{f}"}
  s.test_files        = CLASSES.map{|c| "test/#{NAME}/#{c}_test.rb"}

end
