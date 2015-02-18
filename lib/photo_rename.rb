#!/usr/bin/env ruby

# photo_renamer renames all .jpg files in a given directory to the form IMG_*yyyymmdd*_*hhmmss*.jpg
# Copyright (C) 2013  Tjaart van der Walt

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'optparse'
require 'rubygems'
require 'awesome_print'

class Photo_rename
  def new_name(mdate)
    ret_string = "IMG_"
    ret_string += "#{mdate.year}#{("%02d" % mdate.month).to_s}#{("%02d" % mdate.day).to_s}"
    ret_string += "_#{("%02d" % mdate.hour).to_s}#{("%02d" % mdate.min).to_s}#{("%02d" % mdate.sec).to_s}"
    ret_string += ".jpg"
    return ret_string
  end

  def name_map(dir_path)
    no_change_array = []
    change_map = {}
    Dir.glob("#{dir_path}/*.[jJ][pP][gG]").sort.each do |f|
      if /[Ii][Mm][Gg]\_[0-9]{8}\_[0-9]{6}\.[Jj][Pp][Gg]/.match(f) == nil
        mdate = File.mtime(f)
        change_map[f] = "#{dir_path}/#{new_name(mdate)}"
      else
        no_change_array.push(f)
      end
    end
    return [no_change_array, change_map]
  end

  def print_replace_names(dir_path, map)
    puts "These files are in the correct format and will remain unchanged:"
    ap map[0], :index => false
    puts ""
    puts "These files will be renamed as follows:"
    ap map[1]
    puts "Are you sure you want to continue renaming these files (Y/N)"
    if STDIN.gets.chomp.downcase == "y"
      map[1].each() do |key, value|
        File.rename("#{key}", "#{value}")
      end
    end
  end

  def parse_options(print_opts)
    options = {}

    optparse = OptionParser.new do|opts|
      opts.banner = "Usage: photo_renamer.rb [options] dir1 [dir2 ...]"

      options[:batch] = false
      opts.on( '-b', '--batch', 'Batch mode. Will not ask confirmation before renaming.' ) do
        options[:batch] = true
      end

      opts.on( '-h', '--help', 'Display this screen' ) do
        puts opts
        exit
      end
    end

    if print_opts
      puts print_opts
      puts optparse
    end
    optparse.parse!
    return options
  end
end
