unless RUBY_VERSION[/^1\.8/]
  require 'pry'; binding.pry; exit # Screw IRB.
else
  def pry
    require 'pry'
    pry
    exit
  end
end
