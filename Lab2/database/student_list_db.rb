# frozen_string_literal: true
require 'sqlite3'
require_relative '../student_models/student'
require_relative '../student_models/student_short'
require_relative '../containers/data_list_student_short'
require_relative './database_driver'
class Student_list_db

  attr_reader :db_driver

  def initialize(database: "database/University.sqlite", results_as_hash: true)
    self.db_driver = Database_driver.get_instance(database, results_as_hash)
  end

  def get_student_by_id(id)
    Student.from_hash(db_driver.get_student_by_id(id))
  end

  def delete_student_by_id(id)
    db_driver.delete_student_by_id(id)
  end

  def get_k_n_student_short(k, n)
    req = db_driver.request "SELECT * FROM Students"
    students = []
    req.each do |hash|
      students.append(Student.from_hash(hash))
    end
    Data_list_student_short.new(students.slice(k * n, n).map{|student| Student_short.initialize_from_student(student)})
  end
  def add_student(student)
    db_driver.add_student(student)
  end
  def update_student_by_id(id, student)
    db_driver.update_student_by_id(id, student)
  end
  def get_student_count
    db_driver.get_student_count
  end

  def request(request)
    db_driver.request(request)
  end
  private
  attr_writer :db_driver
end
