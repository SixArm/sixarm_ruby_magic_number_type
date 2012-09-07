# -*- coding: utf-8 -*-

class IO

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
  #   IO.f = File.open("test.ps","rb")
  #   put f.magic_number(s)
  #   => :postscript
  #
  # See:
  #  - IO::MagicNumberTypeHash
  #  - File.magic_number_type
  #
  # TODO change from hash implementation to binary tree

  def magic_number_type(bytes=self.read(String::MagicNumberTypeMaxLength))
    String::MagicNumberTypeHash.each_pair do |byte_string,type_symbol|
      return type_symbol if byte_string==bytes[0,byte_string.length]
    end
    return nil
  end

end
