# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jira_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = 'jira_tracker'
  spec.version       = JiraTracker::VERSION
  spec.authors       = %w(zigomir otobrglez)
  spec.email         = %w(zigomir@gmail.com otobrglez@gmail.com)
  spec.description   = %q{Track time on Jira spent on individual issues}
  spec.summary       = %q{Track time on Jira spent on individual issues}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_runtime_dependency 'jira-ruby'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'

	spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'

end
