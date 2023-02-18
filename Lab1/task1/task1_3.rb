p"Пользователь, введи команду языка ruby."
cmd_ruby= STDIN.gets.chomp
system "ruby -e \"#{cmd_ruby}\""

p"Пользователь, введи команду ОС"
cmd_os = STDIN.gets.chomp
system "#{cmd_os}"


