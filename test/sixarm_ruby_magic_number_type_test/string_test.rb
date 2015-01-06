# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_magic_number_type'


describe String do

  before do
    SAMPLE_STRING_TO_MAGIC_NUMBER_TYPE ||= {
      "<!doctyp" => :html,
      "<html" => :html,
      "<?xml" => :xml,
      "<MakerFile" => :adobe_framemaker,
      "BC" => :bitcode,
      "BM" => :bitmap,
      "BZ" => :bzip,
      "SIMPLE"=> :fits,
      "GIF8" => :gif,
      "GKSM" => :gks,
      ["01DA"].pack('H*') => :iris_rgb,
      ["F10040BB"].pack('H*') => :itc,
      ["FFD8"].pack('H*')  => :jpeg,
      "IIN1" => :niff,
      "MThd" => :midi,
      "%PDF" => :pdf,
      "VIEW" => :pm,
      ["89504E470D0A1A0A"].pack('H*') => :png,
      "Y" + ["A6"].pack('H*') + "j" + ["95"].pack('H*') => :sun_rasterfile,
      "II" + ["2A00"].pack('H*') => :tiff,  # II means Intel format, then 42 little-endian
      "MM" + ["002A"].pack('H*') => :tiff,  # MM means Motorola format, then 42 big-endian
      "gimp xcf" => :gimp_xcf,
      "#FIG" => :xfig,
      "/* XPM */" => :xpm,
      ["1F9D"].pack('H*') => :compress,
      ["1F8B"].pack('H*') => :gzip,
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
      #TODO matroska seems to have multiple magic file types-- diagnose and fix
      #"\x1a\x45\xdf\xa3\xa3\x42\x86\x81\x01\x42\xf7\x81\x01\x42\xf2\x81\x04\x42\xf3\x81\x08\x42\x82\x88matroska" => :matroska_stream,
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
      "4" + ['CDB2A1'].pack('H*') => :tcpdump,
      ":VERSION" => :surfplan_kite_project,
      "AC10" => :autocad,
      ".snd" => :sun_microsystems_law_audio_file,
      "\x23\x21" => :shebang,
      "%!" => :postscript
    }
  end

  it "solves the magic number type" do
    SAMPLE_STRING_TO_MAGIC_NUMBER_TYPE.each_pair{|string, type|
      string.magic_number_type.must_equal type, "Trying #{string} => #{type}"
    }
  end

end
