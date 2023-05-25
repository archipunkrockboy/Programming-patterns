# frozen_string_literal: true
require_relative '../student_models/student'
require_relative '../student_list_models/student_list'
require_relative '../containers/data_list_student_short'
require 'fox16'
class Student_list_controller
  attr_accessor :view, :student_list, :current_page, :max_page, :data_list_student_short

  def initialize(view, adapter: Student_list_db.new)
    @view = view
    #@student_list = Student_list.new(Student_list_file_adapter.new(Student_list_json.new , path: "input_output_files/input.json"))
    @student_list = Student_list.new(adapter)
    @current_page = 0
    @max_page = (self.student_list.get_student_count / 20).ceil
  end

  def refresh_data
    self.data_list_student_short = self.student_list.get_k_n_student_short(current_page, 20)
    self.data_list_student_short.observer_registration(view)
    view.show_pages(current_page + 1, max_page + 1)
    self.data_list_student_short.notify_all
  end

  def previous_page
    if self.current_page > 0
      self.current_page -= 1
      self.refresh_data
    end
  end

  def next_page
    if self.max_page > current_page
      self.current_page += 1
      self.refresh_data
    end
  end

  def show_add_student_window
    show_add_student_window = Add_student_window.new(view)
    add_student_controller = Add_student_controller.new(show_add_student_window, self)
    show_add_student_window.controller = add_student_controller
    show_add_student_window.create
    show_add_student_window.show

  end
end
