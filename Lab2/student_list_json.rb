# frozen_string_literal: true
require './student_list'
class Student_list_json < Student_list_strategy

  def read_from(path, student_list)
  students = JSON.parse(File.read(path))
  students.each do |student|
    student_list.list << Student.new(surname: student["surname"], name: student["name"], lastname: student["lastname"], id: student["id"],
                            phone: student["phone"], tg: student["tg"], mail: student["mail"], git: student["git"])
    end
  end
  def write_to(path, student_list)
    JSON.dump(student_list.list.map{|student| student.to_h}, File.open(path, 'w'))
  end
end
