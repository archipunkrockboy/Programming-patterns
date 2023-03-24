require "./student"

require 'json'
#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
# student3 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", tg:"@tg")

# student3 = Student.make_from_str("ass name")

s2 = Student.new(surname: "surname", name: "name", lastname: "lastname")

p s2.get_info



