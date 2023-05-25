require_relative 'student_list_strategy'
require_relative '../database/student_list_db'
class Student_list
  attr_reader :adapter

  #adapter - объект класса student_list_file_adapter/student_list_db
  def initialize(adapter=Student_list_db.new)
    @adapter = adapter
  end

  def get_student_by_id(id)
    adapter.get_student_by_id(id)
  end

  def get_k_n_student_short(k, n)
    adapter.get_k_n_student_short(k, n)
  end

  def add_student(student)
    adapter.add_student(student)
  end

  def update_student_by_id(student, id)
    adapter.update_student_by_id(student, id)
  end

  def delete_student_by_id(id)
    adapter.delete_student_by_id(id)
  end

  def get_student_count
    adapter.get_student_count
  end

end

