unless RUBY_VERSION[/^1\.8/]
  require 'pry'; binding.pry; exit # Screw IRB.
end
