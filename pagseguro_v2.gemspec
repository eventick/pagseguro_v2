# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pagseguro_v2/version"

Gem::Specification.new do |s|
  s.name        = "pagseguro_v2"
  s.version     = PagseguroV2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cirdes Henrique", "Thiago Diniz"]
  s.email       = ["oi@eventick.com.br"]
  s.homepage    = "http://github.com/eventick/pagseguro_v2"
  s.summary     = %q{Ruby gem for interfacing with Pagseguro V2 API. By http://eventick.co}
  s.description = %q{Ruby gem for interfacing with Pagseguro V2 API.}

  s.rubyforge_project = "pagseguro_v2"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('nokogiri')
  s.add_development_dependency "rspec", "~> 2.10.0"
  s.add_runtime_dependency "hashie", '>= 1.2.0'
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "builder"
end
