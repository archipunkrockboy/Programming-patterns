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
require './student_list_db'
require 'sqlite3'
s1 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Sergeevich", id: 0, git: "@gitasdas")
# s2 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Sergeevich", id: 1, git: "@gitadasd")
s3 = Student.new(name: "Sergey", surname: "Petrov", lastname:"Sergeevich", git: "@gitdasd")
# s4 = Student.new(name: "Sergey", surname: "Sergeev", lastname:"Petrovich", id: 3, git: "@gisadsat")
# s5 = Student.new(name: "Petr", surname: "Sergeev", lastname:"Petrovich", id: 4, git: "@giereet")
#
# sl = Student_list.new(Student_list_json.new)
# sl.read_from('input.json')
# sl.write_to('output.json')
#
# sl = Student_list.new(Student_list_yaml.new)
# sl.read_from('input.yaml')
# sl.write_to('output.yaml')
#
# sl = Student_list.new(Student_list_txt.new)
# sl.read_from('input.txt')
# sl.write_to('output.txt')

db = Student_list_db.new(1)
p db.get_student_count
p db.new_id

