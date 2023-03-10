require "./student"
require 'json'
#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
student3 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", tg:"@tg")

# student3 = Student.make_from_str("ass name")


a ='{"surname": "surname", "name": "name", "lastname": "lastname", "tg": "@eeee"}'
b = 'aeder'
s1 = Student.make_student_from_str(b)
