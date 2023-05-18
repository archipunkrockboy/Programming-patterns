require_relative 'student_list_strategy'
class Student_list
  attr_reader :adapter
  def initialize(adapter)
    @adapter = adapter
  end

  def get_student_by_id(id)
    adapter.get_student_by_id(id)
  end

  def get_k_n_student_short_list(k, n)
    adapter.get_k_n_student_short_list(k, n)
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

