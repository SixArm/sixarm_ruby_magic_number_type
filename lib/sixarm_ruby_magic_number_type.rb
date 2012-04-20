# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

require 'pp'

class IO

  # We implement magic by using a lookup hash.
  # The key is a string that encodes the first bits.
  # The value is a symbol that indicates the magic type.
  #
  # Examples:
  #   IO::MagicNumberType("BM") => :bitmap
  #   IO::MagicNumberType("GIF8") => :gif
  #   IO::MagicNumberType("\xa6\x00") => :pgp_encrypted_data
  #
  # Quirks:
  #   - JPEG adjustment:
  #     - Some cameras put JPEG Exif data in bytes 3 & 4,
  #       so we only check the first two bytes of a JPEG.
  #   - TIFF has two possible matches:
  #     - MM** is Motorola big endian
  #     - II** is Intel little ending
  #
  # See:
  #  - IO#magic_number_type
  #  - File.magic_number_type

  MagicNumberTypeHash = {
    "BC" => :bitcode,
    "BM" => :bitmap,
    "BZ" => :bzip,
    "MZ" => :exe,
    "SIMPLE"=> :fits,
    "GIF8" => :gif,
    "GKSM" => :gks,
    [0x01,0xDA].pack('c*') => :iris_rgb,
    [0xF1,0x00,0x40,0xBB].pack('c*') => :itc,
    [0xFF,0xD8].pack('c*') => :jpeg,
    "IIN1" => :niff,
    "MThd" => :midi,
    "%PDF" => :pdf,
    "VIEW" => :pm,
    [0x89].pack('c*') + "PNG" => :png,
    "%!" => :postscript,
    "Y" + [0xA6].pack('c*') + "j" + [0x95].pack('c*') => :sun_rasterfile,
    "MM*" + [0x00].pack('c*') => :tiff,
    "II*" + [0x00].pack('c*') => :tiff,
    "gimp xcf" => :gimp_xcf,
    "#FIG" => :xfig,
    "/* XPM */" => :xpm,
    [0x23,0x21].pack('c*') => :shebang,
    [0x1F,0x9D].pack('c*') => :compress,
    [0x1F,0x8B].pack('c*') => :gzip,
    "PK" + [0x03,0x04].pack('c*') => :pkzip,
    "MZ" => :dos_os2_windows_executable,
    ".ELF" => :unix_elf,
    [0x99,0x00].pack('c*') => :pgp_public_ring,
    [0x95,0x01].pack('c*') => :pgp_security_ring,
    [0x95,0x00].pack('c*') => :pgp_security_ring,
    [0xA6,0x00].pack('c*') => :pgp_encrypted_data,
    [0xD0,0xCF,0x11,0xE0].pack('c*') => :docfile
  }

  MagicNumberMaxLength = 9  # Longest key


  # Detect the data type by checking various "magic number" conventions
  # for the introductory bytes of a data stream
  #
  # Return the "magic number" as a symbol:
  #  - :bitmap = Bitmap image file, typical extension ".bmp"
  #  - :gzip = Unix GZIP compressed data, typical extension ".gz"
  #  - :postscript = Postscript pages, typical extension ".ps"
  #
  # Return nil if there's no match for any known magic number.
  #
  # Example:
  #   f = File.open("test.ps","rb")
  #   put f.magic_number(s)
  #   => :postscript
  #
  # See:
  #  - IO::MagicNumberTypeHash
  #  - File.magic_number_type

  def magic_number_type
    bytes = ""
    while bytes.size < 9 #MagicNumberMaxLengh
      bytes += read(1)
      type = MagicNumberTypeHash[bytes]
      return type if type 
    end
    return nil
  end

end


class File

  # Detect the file's data type by opening the file then
  # using IO#magic_number_type to read the first bits.
  #
  # Return a magic number type symbol, e.g. :bitmap, :jpg, etc.
  #
  # Example:
  #   puts File.magic_number_type("test.ps") => :postscript
  #
  # See
  #   - IO#MagicNumberTypeHash
  #   - IO#magic_number_type

  def self.magic_number_type(file_name)
    File.open(file_name,"rb"){|f| f.magic_number_type }
  end

end

