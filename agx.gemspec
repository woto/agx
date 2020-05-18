require_relative 'lib/agx/version'

Gem::Specification.new do |spec|
  spec.name          = "agx"
  spec.license       = "MIT"
  spec.version       = Agx::VERSION
  spec.authors       = ["Ruslan Kornev"]
  spec.email         = ["oganer@gmail.com"]

  spec.summary       = %q{Handy shell for ag results.}
  spec.description   = %q{Handy shell for ag results.}
  spec.homepage      = "https://github.com/woto/agx"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/woto/agx"
  spec.metadata["changelog_uri"] = "https://github.com/woto/agx/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-tree"
  spec.add_dependency "tty-prompt"
  spec.add_dependency "tty-cursor"
  spec.add_dependency "tty-editor"
  spec.add_dependency "activesupport"
end
