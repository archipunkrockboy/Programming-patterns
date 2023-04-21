# frozen_string_literal: true
require './sqlite3'
class Student_list_db
  attr_accessor :db

  def initialize(db: "University.sqlite", results_as_hash: true)
    self.db = SQLite3::Database.open db
    self.db.results_as_hash = results_as_hash
  end

end
