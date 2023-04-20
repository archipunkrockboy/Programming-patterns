# frozen_string_literal: true
require "json"
require './data_list'
require './student'
require './student_short'
require './student_list'
class Student_list_txt < Student_list_strategy

  def read_from(path, student_list)
    File.readlines(path).each do |str|
      student_list.list << Student.make_student_from_str(make_json_str(str))
    end
  end

  def write_to(path, student_list)
    file = File.open(path, 'w')
    student_list.list.each do |student|
      file.write("#{student.to_s}\n")
    end

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
