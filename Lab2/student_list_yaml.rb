# frozen_string_literal: true
require './student_list'
class Student_list_yaml < Student_list_strategy

  protected
  def parse(path)
    Psych.load_file(path)
  end

  def get_data(list)
    YAML.dump(list.map{|student| student.to_h})
  end
end
