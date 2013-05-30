mdate = File.mtime("testfile")

puts mdate

folder_path = "/home/tjaart/dev/git/photo_renamer/photos"
Dir.glob(folder_path + "/*").sort.each do |f|
    filename = File.basename(f, File.extname(f))
    File.rename(f, filename.capitalize + File.extname(f))
end

puts mdate.year
puts "%02d" % mdate.month
puts "%02d" % mdate.day

puts "%02d" % mdate.hour
puts "%02d" % mdate.min
puts "%02d" % mdate.sec

