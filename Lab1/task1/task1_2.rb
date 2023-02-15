p"Как тебя зовут?"
name = ARGV[0]
p("Привет, #{name}! Какой твой любимый язык программирования?")
programming_language = STDIN.gets.chomp.downcase
case programming_language
when "ruby"
  p"Подлиза!!"
when "python"
  p"Соболезную, но ничего, скоро будет ruby"
when "prolog", "f#"
  p"У тебя большое будущее!"
when "c++"
  p"Хароош, но скоро будет ruby"
when "pascal"
  p"Неплохой выбор, но скоро будет ruby"
else
  p"Что бы это не значило, скоро будет ruby"
end



