# SixArm.com » Ruby » <br> MagicNumberType infers mime types from leading bits

* Docs: <http://sixarm.com/sixarm_ruby_magic_number_type/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_magic_number_type>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction


Magic numbers are the first bits of a file or data stream
which uniquely identify the type of file or data stream.

For example when the first bits are "BM",
this identifies the file as a bitmap image file.

For docs go to <http://sixarm.com/sixarm_ruby_magic_number_type/doc>

Want to help? We're happy to get pull requests.


## Quickstart

Install:

    gem install sixarm_ruby_magic_number_type

Bundler:

    gem "sixarm_ruby_magic_number_type", "=1.0.0"

Require:

    require "sixarm_ruby_magic_number_type"


## Details

This gem infers based on widespread programming conventions for data file formats.

These magic numbers are by convention and we are using this guide:
http://www.astro.keele.ac.uk/oldusers/rno/Computing/File_magic.html

Typical uses of magic numbers:

  * to quickly identify a file's data type
  * to check if data matches the file's MIME type or extension
  * to check if a web form file upload matches its HTTP content type

Compare:

  * MIME::Types ruby library 
  * Unix magic() command for testing files on disk
  * http://shared-mime.rubyforge.org/

