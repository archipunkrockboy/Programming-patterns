# frozen_string_literal: true
require './student_list_strategy'
class Student_list
  attr_reader :list
  def initialize(strategy)
    self.list = []
    self.strategy = strategy
  end

  def read_from(path)
    strategy.read_from(path, self)
  end

  def write_to(path)
    strategy.write_to(path, self)
  end
  def get_student_short_list(page, data_list: nil)
    return Data_list.new(list.slice((page - 1) * 10, 10)) if data_list.nil?
    data_list.list = list.slice((page - 1) * 10, 10)
    data_list.delete_selected
    data_list
  end

  def get_student_by_id(id)
    list.each do|student|
      return student if student.id == id
    end
    raise ArgumentError, "There is no student with the entered id #{id}"
  end

  def update_student_by_id(student, id)
    begin
      list[id] = student
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end

  def insert_student(student)
    student.id = get_id
    list << student
  end
  def delete_student_by_id(id)
    begin
      list.delete_at(id)
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end

  def sort_by
    list.sort_by{|student|student.surname_and_initials}
  end

  def get_student_count
    list.size
  end

  def get_id
    new_id = list[0].id
    list.map{|student| new_id = student.id if student.id > new_id}
    new_id + 1
  end
  private
  attr_accessor :strategy
end
