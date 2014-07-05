Gem::Specification.new do |s|
  s.name        = 'photo_rename'
  s.version     = '0.0.1'
  s.executables << 'photo_rename'
  s.date        = '2014-07-01'
  s.summary     = "Photo renamer"
  s.description = "Rename JPG images in a directory based on the date in the file's mtime field. By default the target file names are in the same format as those created by Android devices."
  s.authors     = ["Tjaart van der Walt"]
  s.email       = 'gem@tjaart.co.za'
  s.files       = ["lib/photo_rename.rb"]
  s.homepage    ='https://github.com/tjaartvdwalt/photo-renamer'
  s.license     = 'GNU GPL'
end
