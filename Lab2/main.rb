require "./student"
require "./student_short"
require 'json'
#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
# student3 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", tg:"@tg")



s2 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", phone: "+79180887978", id: 5)
sh = Student_short.initialize_from_student(s2)

p sh





