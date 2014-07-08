# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'photo_rename/version'

Gem::Specification.new do |spec|
  spec.name          = "photo_rename"
  spec.version       = PhotoRename::VERSION
  spec.authors       = ["Tjaart van der Walt"]
  spec.email         = ["github@tjaart.co.za"]
  spec.summary     = "Photo renamer"
  spec.description = "Rename JPG images in a directory based on the date in the file's mtime field. By default the target file names are in the same format as those created by Android devices."
  spec.homepage    ='https://github.com/tjaartvdwalt/photo_rename'
  spec.license       = "GNU GPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  
  spec.add_runtime_dependency "awesome_print" , "~> 1.2"
  
  spec.required_ruby_version = '~> 2.0'
end
