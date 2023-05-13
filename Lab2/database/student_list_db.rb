# frozen_string_literal: true
require 'sqlite3'
require '../student_models/student'
require_relative './database_driver'
class Student_list_db

  private_class_method :new
  attr_reader :db_driver

  def initialize(database: "University.sqlite", results_as_hash: true)
    self.db_driver = Database_driver.get_instance(database, results_as_hash)
  end

  def get_student_by_id(id)
    Student.from_hash(db_driver.get_student_by_id(id))
  end

  def delete_student_by_id(id)
    db_driver.delete_student_by_id(id)
  end

  def insert_student(student)
    db_driver.insert_student(student)
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