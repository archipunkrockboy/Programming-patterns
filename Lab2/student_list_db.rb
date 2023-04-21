# frozen_string_literal: true
require 'sqlite3'
require './student'
class Student_list_db
  attr_accessor :db

  def initialize(db: "University.sqlite", results_as_hash: true)
    self.db = SQLite3::Database.open db
    self.db.results_as_hash = results_as_hash
  end

  def get_student_by_id(id)
    Student.from_hash((db.execute "SELECT * FROM Students WHERE id == ?", id)[0])
  end
end
