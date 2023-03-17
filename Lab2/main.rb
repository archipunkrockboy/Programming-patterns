require "./student"
require 'json'
#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
# student3 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", tg:"@tg")

# student3 = Student.make_from_str("ass name")


s1 = Student.new(surname: "Manukyan", name: "Artur", lastname: "Vaginakovich", git:"@git", phone:"+79189315711", tg:"@tg")
s2 = Student.new(surname: "Manukyan", name: "Artur", lastname: "Vaginakovich", git:"@git", phone:"+79189315711", tg:"@tg")
s3 = Student.new(surname: "Manukyan", name: "Artur", lastname: "Vaginakovich")
s4 = Student.new(surname: "Manukyan", name: "Artur", lastname: "Vaginakovich", git:"@git", phone:"+79189315711", tg:"@tg")

p s1.get_info
p s2.get_info
p s3.get_info
p s4.get_info