# frozen_string_literal: true
require_relative 'student_list_base'
require_relative 'student_list_yaml'
require_relative 'student_list_json'
require_relative 'student_list_txt'
class Student_list_file_adapter
  attr_reader :file_driver, :file
  def initialize(strategy, path: nil)
    @file_driver = Student_list_base.new(strategy, path)
    @file = path
  end

  def get_student_by_id(id)
    file_driver.get_student_by_id(id)
  end

  def get_k_n_student_short(k, n)
    file_driver.get_k_n_student_short(k, n)
  end

  def add_student(student)
    file_driver.add_student(student)
  end

  def update_student_by_id(student, id)
    file_driver.update_student_by_id(student, id)
  end

  def delete_student_by_id(id)
    file_driver.delete_student_by_id(id)
  end

  def get_student_count
    file_driver.get_student_count
  end

end
