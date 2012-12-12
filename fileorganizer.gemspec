Gem::Specification.new do |s|  
  s.name        = 'fileorganizer'
  s.version     = '0.0.3'
  s.date        = '2012-12-11'
  s.summary     = "Renames and organizes files"
  s.description = "This is a gem that renames files based on their 'modified date' and organizes them into folders for each date"
  s.authors     = ["Brian Ward"]
  s.email       = 'brianmatthewward@gmail.com'
  s.homepage    = 'https://github.com/brianward/fileorganizer'
  s.add_dependency 'rake'
  s.add_dependency 'rspec'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables = ["fileorganizer"]
end