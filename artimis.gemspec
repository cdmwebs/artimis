# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artimis/version"

Gem::Specification.new do |s|
  s.name        = "artimis"
  s.version     = Artimis::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Moore"]
  s.email       = ["chris@26webs.com"]
  s.homepage    = "http://github.com/cdmwebs/artimis"
  s.summary     = %q{A DSL for scraping the ARTIMIS website.}
  s.description = %q{A DSL for scraping the ARTIMIS website.}

  s.rubyforge_project = "artimis"

  s.add_runtime_dependency "mechanize"

  s.files         = `git ls-files`.split("\n").collect { |f| f unless f =~ /version/ }.compact
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
