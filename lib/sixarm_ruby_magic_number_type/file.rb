# -*- coding: utf-8 -*-

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
  #
  def self.magic_number_type(file_name)
    f = File.open(file_name,"rb")
    type = f.magic_number_type
    f.close
    return type
  end

end
