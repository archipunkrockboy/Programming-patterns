# frozen_string_literal: true
require_relative '../containers/data_list'
require_relative '../containers/data_list_student_short'
class Student_list_base
  attr_accessor :list, :path

  #strategy - student_list_[txt|json|yaml]
  def initialize(strategy, path)
    self.list = []
    self.strategy = strategy
    self.path = path
  end

  def read_from(path)
    strategy.read_from(path, self)
  end

  def write_to(path)
    strategy.write_to(path, self)
  end

  def get_student_by_id(id)
    list.each do|student|
      return student if student.id == id
    end
    raise ArgumentError, "There is no student with the entered id #{id}"
  end
  def get_k_n_student_short(k, n)
    read_from(path)
    Data_list_student_short.new(list.slice(k * n, n).map{|student| Student_short.initialize_from_student(student)})
  end

  def add_student(student)
    student.id = get_id
    list << student
  end

  def update_student_by_id(student, id)
    begin
      list[id] = student
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end


  def delete_student_by_id(id)
    begin
      list.delete_at(id)
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end



  def get_student_count
    list.size
  end

  def sort_by
    list.sort_by{|student|student.surname_and_initials}
  end

  def get_id
    if list == []
      p 1
      return 1
    end
    new_id = list[0].id
    list.map{|student| new_id = student.id if student.id > new_id}
    new_id + 1
  end

  private
  attr_accessor :strategy
end
