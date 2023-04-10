# frozen_string_literal: true
require "json"
require './data_list'
require './student'
require './student_short'
class Student_list_txt
  attr_accessor :list
  def initialize
    @list = []
  end
  def read_from_txt(path)
    begin
      File.readlines(path).each do |str|
        list << Student.make_student_from_str(make_json_str(str))
      end
      result
    rescue Errno::ENOENT
      p "No such file or directory: #{path}"
    end
  end

  def write_to_txt(path)
    begin
      file = File.open(path, 'w')
      list.each do |student|
        file.write("#{student.to_s}\n")
      end
    rescue IOError
      p "Error writing to file: #{path}"
    end
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

  protected
  #на вход строка, на выход json-строка
  def make_json_str(str)
    result = ''
    str.split(' ').each do |word|
      if word[-1] == ':'
        result += '"' + word.slice(0..word.size-2) + '": '
      else
        if word[-1] == ','
          result += '"' + word.slice(0..word.size-2) + '", '
        else result += '"' + word + '"'
        end
      end
    end
    '{' + result + '}'
  end
end
