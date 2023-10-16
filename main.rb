require_relative 'app'
require_relative 'lib/launcher'

def main
  puts "\nWelcome to School Library App!"
  puts "\n"

  Launcher.new.start
end

main
