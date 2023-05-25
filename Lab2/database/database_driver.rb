# frozen_string_literal: true
require 'sqlite3'
# require '../student_models/student'
class Database_driver

  attr_accessor :database
  private_class_method :new
  @@instance = nil

  def self.get_instance(database, results_as_hash)
    if @@instance
      @@instance.set_parameters(database, results_as_hash)
    else
      @@instance = new(database, results_as_hash)
    end
  end

  def set_parameters(database, results_as_hash)
    self.database = SQLite3::Database.open database
    self.database.results_as_hash = results_as_hash
  end

  def get_student_by_id(id)
    database.execute "SELECT * FROM Students WHERE id == ?", id[0]
  end

  def delete_student_by_id(id)
    database.execute "DELETE From Students WHERE id == ?", id
  end

  def add_student(student)
    database.execute "INSERT INTO Students (id, surname, name, lastname, phone, tg, mail, git)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)", new_id, student.surname, student.name, student.lastname,
               student.phone, student.tg, student.mail, student.git
  end

  def update_student_by_id(id, student)
    database.execute "UPDATE Students
                SET surname = ?, name = ?, lastname = ?,
                    phone   = ?, tg   = ?, mail     = ?,
                    git = ?
                WHERE id == ?", student.surname, student.name, student.lastname,
               student.phone, student.tg ,student.mail, student.git, id
  end

  def get_student_count
    (database.execute "SELECT COUNT(*) as count FROM Students")[0]["count"]
  end

  def request(request)
    database.execute request
  end

  private

  def new_id
    (database.execute "SELECT MAX(id) as max FROM Students")[0]["max"] + 1
  end

  def initialize(database, results_as_hash)
    set_parameters(database, results_as_hash)
  end

end
