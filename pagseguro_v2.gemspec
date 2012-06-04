# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pagseguro_v2/version"

Gem::Specification.new do |s|
  s.name        = "pagseguro_v2"
  s.version     = PagseguroV2::VERSION
  s.authors     = ["Cirdes Henrique", "Thiago Diniz"]
  s.email       = ["cirdes@eventick.com.br", "thiago@eventick.com.br"]
  s.homepage    = "eventick.com.br"
  s.summary     = %q{Ruby gem for interfacing with Pagseguro V2 API. By http://eventick.co}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "pagseguro_v2"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "hashie", '>= 1.2.0'
  s.add_runtime_dependency "httparty"
  # specify any dependencies here; for example:
  # s.add_runtime_dependency "rest-client"
end
