# Ruby » <br> MagicNumberType infers mime types from leading bits

* Doc: <http://sixarm.com/sixarm_ruby_magic_number_type/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_magic_number_type>
* Repo: <http://github.com/sixarm/sixarm_ruby_magic_number_type>
<!--HEADER-SHUT-->


## Introduction

Magic numbers are the first bits of a file or data stream
which uniquely identify the type of file or data stream.

For example when the first bits are "BM",
this identifies the file as a bitmap image file.

For docs go to <http://sixarm.com/sixarm_ruby_magic_number_type/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_magic_number_type", ">= 2.0.3, < 3"

To install using the command line, run this:

    gem install sixarm_ruby_magic_number_type -v ">= 2.0.3, < 3"

To install using the command with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_magic_number_type -v ">= 2.0.3, < 3" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_magic_number_type"

<!--INSTALL-SHUT-->


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


## Contributors

* [Joel Parker Henderson](https://github.com/joelparkerhenderson)
* [Bill Lazar](https://github.com/billlazar)
* [Kip Cole](https://github.com/kipcole9)
