require "./student"

#student1 = Student.new("Месси", "Лионель", "Барселонович", {mail: "hozyainreala@mail.ru"})
#student2 = Student.new("Криштиану", "Роналду", "Альнасрович", {phone: "+79188374645"})
student3 = Student.new(surname: "surname", name: "name", lastname: "lastname")
student3.set_contacts(tg: "@ade")
p student3