Gem::Specification.new do |s|
  s.name        = 'ije'
  s.version     = '0.0.1'
  s.date        = '2016-12-16'
  s.summary     = "IJE format support"
  s.description = "Supports reading and writing of IJE formatted data"
  s.authors     = ["Pete Krautscheid"]
  s.email       = 'krautscheid@mitre.org'
  s.files       = ["lib/ije.rb"]
  s.license     = 'Apache 2.0'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
