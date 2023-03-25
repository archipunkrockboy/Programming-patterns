require "json"
class Student_short
  def initialize(id, str)
    args = JSON.parse(str)
    @surname_and_initials = args["surname_and_initials"]
    @id = id
    @git = args["git"]
    @contact = args["contact"]
  end
  def self.initialize_from_student(student)
    raise ArgumentError, "The argument must be Student, not #{student.class}!" unless student.is_a?(Student)
    new(student.id, student.get_info)
  end

end
