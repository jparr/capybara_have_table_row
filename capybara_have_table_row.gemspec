# frozen_string_literal: true

require_relative "lib/capybara_have_table_row/version"

Gem::Specification.new do |spec|
  spec.name = "capybara_have_table_row"
  spec.version = CapybaraHaveTableRow::VERSION
  spec.authors = ["Jeff Parr"]
  spec.email = ["jeffparr100@gmail.com"]

  spec.summary = "Rspec matcher for table row selector with better errors"
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://www.github.com/jparr/capybara_have_table_row"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/jparr/capybara_have_table_row"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara", ">= 3.31"
  spec.add_dependency "terminal-table"
  spec.add_dependency "xpath", ">= 3.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
