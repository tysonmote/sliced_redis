# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sliced_redis/version"

Gem::Specification.new do |s|
  s.name        = "sliced_redis"
  s.version     = SlicedRedis::VERSION
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@tysontate.com"]
  s.homepage    = "http://github.com/tysontate/sliced_redis"
  s.summary     = "Slice and dice Redis SET commands."
  s.description = "Cut up large Redis SET commands into smaller pieces."

  s.rubyforge_project = "sliced_redis"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_runtime_dependency "redis"
end
