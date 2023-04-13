# frozen_string_literal: true

class Student_list_yaml
  attr_accessor :list
  def initialize
    @list = []
  end
  def read_from_yaml(path)
    begin
      students = Psych.load_file(path)
      students.each do |student|
        list.append(Student.new(surname: student["surname"], name: student["name"], lastname: student["lastname"], id: student["id"],
                                phone: student["phone"], tg: student["tg"], mail: student["mail"], git: student["git"]))
      end
    rescue Errno::ENOENT
      p "No such file or directory: #{path}"
    end
  end

  def write_to_yaml(path)
    begin
      File.write(path, YAML.dump(list.map{|student| student.to_h}))
    rescue IOError
      p "Error writing to file: #{path}"
    end
  end

  def get_student_short_list(page, data_list: nil)
    return Data_list.new(list.slice((page - 1) * 10, 10)) if data_list.nil?
    data_list.list = list.slice((page - 1) * 10, 10)
    data_list.delete_selected
    data_list
  end

  def get_student_by_id(id)
    list.each do|student|
      return student if student.id == id
    end
    raise ArgumentError, "There is no student with the entered id #{id}"
  end

  def update_student_by_id(student, id)
    begin
      list[id] = student
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end

  def insert_student(student)
    student.id = get_id
    list << student
  end
  def delete_student_by_id(id)
    begin
      list.delete_at(id)
    rescue StandardError
      p "There is no student with the entered id: #{id}"
    end
  end

  def sort_by
    list.sort_by{|student|student.surname_and_initials}
  end

  def get_student_count
    list.size
  end

  def get_id
    new_id = list[0].id
    list.map{|student| new_id = student.id if student.id > new_id}
    new_id + 1
  end
end
