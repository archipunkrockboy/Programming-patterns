# frozen_string_literal: true
require "json"
require './data_list'
require './student'
require './student_short'
require './student_list'
class Student_list_txt < Student_list_strategy

  protected
  def parse(path)
    students = []
    File.read(path).split(/\n/).each do |student|
      students << JSON.parse(make_json_str(student))
    end
    students
  end

  def get_data(list)
    result = ""
    list.each do |student|
      result += student.to_s + '\n'
    end
    result
  end

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
