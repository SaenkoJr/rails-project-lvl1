# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'hexlet_code'
  spec.version       = HexletCode::VERSION
  spec.authors       = ['Maksim Saenko']
  spec.email         = ['mm.saenko@gmail.com']

  spec.summary       = 'Forms made easy'
  spec.description   = 'Forms made easy'
  spec.homepage      = 'https://github.com/SaenkoJr/rails-project-lvl1'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SaenkoJr/rails-project-lvl1'

  spec.require_paths = ['lib']
end
