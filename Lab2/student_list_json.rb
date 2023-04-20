# frozen_string_literal: true
require './student_list'
class Student_list_json < Student_list_strategy
  protected
  def parse(path)
    JSON.parse(File.read(path))
  end

  def get_data(list)
    JSON.dump(list.map{|student| student.to_h})
  end
end
