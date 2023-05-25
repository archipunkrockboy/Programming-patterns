require_relative 'student_models/student'
require_relative 'student_models/student_short'
require_relative 'student_list_models/student_list'
require_relative 'student_list_models/student_list_yaml'
require_relative 'student_list_models/student_list_json'
require_relative 'student_list_models/student_list_txt'
require_relative 'student_list_models/student_list_file_adapter'
require_relative 'containers/data_list'
require_relative 'containers/data_list_student_short'
require_relative 'containers/data_table'
require_relative 'database/database_driver'
require_relative 'database/student_list_db'
require_relative 'gui/main_window'
require 'sqlite3'


if __FILE__ == $0
  FXApp.new do |app|
    Main_window.new(app)
    app.create
    app.run
  end
end







