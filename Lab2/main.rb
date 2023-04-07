require "./student"
require "./student_short"
require 'json'
require './data_table'
require './data_list'
require './data_list_student_short'

s1 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Sergeevich", id: 0, git: "@gitasdas")
s2 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Sergeevich", id: 1, git: "@gitadasd")
s3 = Student.new(name: "Sergey", surname: "Petrov", lastname:"Sergeevich", id: 2, git: "@gitdasd")
s4 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Petrovich", id: 3, git: "@gisadsat")
s5 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Petrovich", id: 4, git: "@giereet")
sh = []
[s1, s2, s3, s4, s5].each do|s|
  sh.append(Student_short.initialize_from_student(s))
end

dlsh = Data_list_student_short.new(sh)
p dlsh.get_names
p dlsh.get_data