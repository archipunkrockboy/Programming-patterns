require_relative '../student_models/student'
class Student_list_strategy
  def read_from(path, student_list)
    students = parse(path)
    students.each do |student|
      student_list.list << Student.from_hash(student)
    end
  end
  def write_to(path, student_list)
    File.write(path, get_data(student_list.list))
  end

  #необходимо переопределять в наследниках
  protected
  def parse(path)
  end
  def get_data(list)
  end

  def initialize
  end
end
