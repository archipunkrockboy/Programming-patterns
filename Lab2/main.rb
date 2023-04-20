require "./student"
require "./student_short"
require 'json'
require 'yaml'
require './data_table'
require './data_list'
require './data_list_student_short'
require './student_list_txt'
require './student_list_json'
require './student_list_yaml'
s1 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Sergeevich", id: 0, git: "@gitasdas")
s2 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Sergeevich", id: 1, git: "@gitadasd")
s3 = Student.new(name: "Sergey", surname: "Petrov", lastname:"Sergeevich", id: 2, git: "@gitdasd")
s4 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Petrovich", id: 3, git: "@gisadsat")
s5 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Petrovich", id: 4, git: "@giereet")

a = Student_list.new
[s1, s2, s3, s4 ,s5].each do |s|
  a.list << s
end
a.read_from('input.json')
a.read_from('input.yaml')
a.read_from('input.txt')

a.write_to('output.json')
a.write_to('output.yaml')
a.write_to('output.txt')

