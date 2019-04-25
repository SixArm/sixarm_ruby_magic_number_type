# SixArm.com → Ruby → <br> MagicNumberType infers mime types from leading bits

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_magic_number_type.svg)](http://badge.fury.io/rb/sixarm_ruby_magic_number_type)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_magic_number_type.png)](https://travis-ci.org/SixArm/sixarm_ruby_magic_number_type)
[![Code Climate](https://api.codeclimate.com/v1/badges/6430fd86f553be7f328a/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_magic_number_type/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_magic_number_type>
* Doc: <http://sixarm.com/sixarm_ruby_magic_number_type/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_magic_number_type>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

Magic numbers are the first bits of a file or data stream
which uniquely identify the type of file or data stream.

For example when the first bits are "BM",
this identifies the file as a bitmap image file.

For docs go to <http://sixarm.com/sixarm_ruby_magic_number_type/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_magic_number_type

### Gemfile

To add this gem to your Gemfile:

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
