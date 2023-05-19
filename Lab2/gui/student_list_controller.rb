# frozen_string_literal: true
require_relative '../student_models/student'
require_relative '../student_list_models/student_list'
require_relative '../containers/data_list_student_short'

class Student_list_controller
  attr_accessor :view, :student_list, :current_page
  attr_reader :data_list_student_short
  def initialize(view, adapter: Student_list_db.new)
    @view = view
    @current_page = 0
    @student_list = Student_list.new(adapter)
  end

  def refresh_data
    @data_list_student_short = student_list.get_k_n_student_short(current_page, 20)
    p 1
    data_list_student_short.notify(view)
  end
end
