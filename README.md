# SixArm.com → Ruby → <br> MagicNumberType infers mime types from leading bits

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_magic_number_type.svg)](http://badge.fury.io/rb/sixarm_ruby_magic_number_type)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_magic_number_type.png)](https://travis-ci.org/SixArm/sixarm_ruby_magic_number_type)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/$id/maintainability)](https://codeclimate.com/github/SixArm/$dir/maintainability)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_magic_number_type/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_magic_number_type?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_magic_number_type>
* Doc: <http://sixarm.com/sixarm_ruby_magic_number_type/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_magic_number_type>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

Magic numbers are the first bits of a file or data stream
which uniquely identify the type of file or data stream.

For example when the first bits are "BM",
this identifies the file as a bitmap image file.

For docs go to <http://sixarm.com/sixarm_ruby_magic_number_type/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_magic_number_type

Or add this to your Gemfile:

    gem 'sixarm_ruby_magic_number_type'

### Require

To require the gem in your code:

    require 'sixarm_ruby_magic_number_type'

<!--install-shut-->


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
