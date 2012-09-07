# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

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
    "<!doctyp" => :html,
    "<html" => :html,
    "<?xml" => :xml,
    "<MakerFile" => :adobe_framemaker,
    "BC" => :bitcode,
    "BM" => :bitmap,
    "BZ" => :bzip,
    "MZ" => :exe,
    "SIMPLE"=> :fits,
    "GIF8" => :gif,
    "GKSM" => :gks,
    "\x01\xDA" => :iris_rgb,
    "\xF1\x00\x40\xBB" => :itc,
    "\xFF\xD8" => :jpeg,
    "IIN1" => :niff,
    "MThd" => :midi,
    "%PDF" => :pdf,
    "VIEW" => :pm,
    "\x89PNG" => :png,
    "%!" => :postscript,
    "Y\xA6j\x95" => :sun_rasterfile,
    "MM*\x00" => :tiff,
    "II\x00" => :tiff,
    "gimp xcf" => :gimp_xcf,
    "#FIG" => :xfig,
    "/* XPM */" => :xpm,
    "\x23\x21" => :shebang,
    "\x1F\x9D" => :compress,
    "\x1F\x8B" => :gzip,
    "\x1F\xA0" => :tar_file_using_lzh_compression,
    "PK\x03\x04" => :pkzip,
    "7Z\xBC\xAF\x27\x1C" => :seven_zip,
    "MZ" => :dos_os2_windows_executable,
    ".ELF" => :unix_elf,
    "\x99\x00" => :pgp_public_ring,
    "\x95\x01" => :pgp_security_ring,
    "\x95\x00" => :pgp_security_ring,
    "\xA6\x00" => :pgp_encrypted_data,
    "\xD0\xCF\x11\xE0" => :docfile,
    "\x1A\x45\xDF\xA3\x93\x42\x82\x88matroska" => :matroska_stream,
    ".RTS COMPRESSED IMAGE" => :runtime_software_disk_image,
    "WS" => :wordstar_document,
    "!BDN" => :microsoft_outlook_personal_folder_file,
    "# Disk Descripto" => :vmware_disk_description,
    "# Microsoft Developer Studio" => :microsoft_developer_studio,
    "#!AMR" => :adaptive_multi_rate,
    "#?RADIANCE." => :radiance_high_dynamic_range_image_file,
    "%!PS-Adobe-3.0 EPSF-3.0" => :encapsulated_postscript,
    "8BPS" => :adobe_photoshop,
    "\x00\xBF" => :adobe_flash_shared_object,  # Typically a flash cookie
    "\x00\x00\x00\x14ftypisom" => :iso_base_media,  # ISO Base Media file (MPEG-4) v1
    "\x00\x00\x00\x14ftypqt" => :quicktime_movie,
    "\x00\x00\x00\x14fty3gp5" => :mpeg4_video,
    "\x00\x00\x00\x14ftymp42" => :mpeg4_video_quicktime,
    "\x00\x00\x00\x14ftyM4A" => :app_lossless_audio_codec,
    "\x00\x01\x00\x00MYISAM DATABASE" => :msisam_database,  # e.g. Microsoft Money
    "\x00\x01\x00\x00Standard ACE DB" => :microsoft_access_ace_db,
    "\x00\x01\x00\x00Standard Jet DB" => :microsoft_access_jet_db,
    "\x00\x01BA" => :palm_address_book,
    "\x00\x01BD" => :palm_date_book,
    "\x01\x0F\x00\x00" => :microsoft_sql_server_2000,
    "(This file must be converted with BinHex" => :binhex,
    "***  Installation Started" => :symantec_wise_installer_log_file,
    ".REC" => :realplayer_video,
    ".RMF" => :realplayer_media,
    "01ORDNANCE SURVEY" => :national_transfer_format_map,
    "\x31\xBE" => :microsoft_write,
    "\x32\xBE" => :microsoft_write,
    "4\xCD\xB2\xA1" => :tcpdump,
    ":VERSION" => :surfplan_kite_project,
    "AC10" => :autocad,
    ".snd" => :sun_microsystems_law_audio_file
  }

  MagicNumberMaxLength = 41  # Longest key


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
    while bytes.size < 41 #MagicNumberMaxLengh
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
