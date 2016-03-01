# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "geburtstagsspiel"
  spec.version       = '1.0'
  spec.authors       = ["Mathias Seebeck"]
  spec.email         = ["youremail@yourdomain.com"]
  spec.summary       = %q{Unsere Tour durch Köln}
  spec.description   = %q{Entdecke Köln in spielerischer Form.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/geburtstagsspiel.rb']
  spec.executables   = ['bin/geburtstagsspiel']
  spec.test_files    = ['tests/test_geburtstagsspiel.rb']
  spec.require_paths = ["lib"]
end