# frozen_string_literal: true
require 'sqlite3'
require './student'
class Student_list_db

  private_class_method :new
  @@instance = nil

  def initialize(database)
    self.set_parameters(database)
  end

  def self.get_instance(database: "University.sqlite")
    if @@instance.nil? then
      @@instance = new(database)
    else
      self.set_parameters(database)
    end
    @@instance
  end

  def get_student_by_id(id)
    Student.from_hash((db.execute "SELECT * FROM Students WHERE id == ?", id)[0])
  end

  def delete_student_by_id(id)
    db.execute "DELETE FROM Students WHERE id == ?", id
  end

  def insert_student(student)
    db.execute "INSERT INTO Students (id, surname, name, lastname, phone, tg, mail, git)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)", new_id, student.surname, student.name, student.lastname,
                student.phone, student.tg, student.mail, student.git
  end
  def update_student_by_id(id, student)
    db.execute "UPDATE Students
                SET surname = ?, name = ?, lastname = ?,
                    phone   = ?, tg   = ?, mail     = ?,
                    git = ?
                WHERE id == ?", student.surname, student.name, student.lastname,
                                student.phone, student.tg ,student.mail, student.git, id
  end
  def get_student_count
    (db.execute "SELECT COUNT(*) as count FROM Students")[0]["count"]
  end

  def request(request)
    db.execute request
  end


  private
  attr_accessor :db
  def set_parameters(db)
    self.db = SQLite3::Database.open db
    self.db.results_as_hash = true
  end

  def new_id
    (db.execute "SELECT MAX(id) as max FROM Students")[0]["max"] + 1
  end

end