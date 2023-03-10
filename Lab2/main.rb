require "./student"

#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
student3 = Student.new(surname: "surname", name: "name", lastname: "lastname", git: "@git", tg:"@tg")

if student3.validate?
  p "asde"
end

student3.show_info