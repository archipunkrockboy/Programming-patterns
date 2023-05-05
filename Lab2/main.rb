require_relative 'student_models/student'
require_relative 'student_models/student_short'
require_relative 'student_list_models/student_list'
require_relative 'student_list_models/student_list_yaml'
require_relative 'student_list_models/student_list_json'
require_relative 'student_list_models/student_list_txt'
require_relative 'containers/data_list'
require_relative 'containers/data_list_student_short'
require_relative 'containers/data_table'

s = Student.new(surname: "Surname", name: "Name", lastname: "Lastname", git:"@github", tg: "@tggg", phone: "+79189315711")
sh = Student_short.initialize_from_student(s)
dl = Data_list.new([s])
dlsh = Data_list_student_short.new([sh])