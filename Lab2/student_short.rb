require "json"
class Student_short
  attr_reader :surname_and_initials, :id, :git, :contact
  def initialize(id, str)
    begin
      args = JSON.parse(str)
      raise ArgumentError, "#{str} doesn't contain information about student!" if args.nil?
      @surname_and_initials = args["surname_and_initials"]
      @id = id
      @git = args["git"]
      @contact = args["contact"]
    rescue JSON::ParserError
      p "Unable to extract data from #{str}"
    end
  end
  def self.initialize_from_student(student)
    raise ArgumentError, "The argument must be Student, not #{student.class}!" unless student.is_a?(Student)
    Student_short.new(student.id, student.get_info)
  end
  
end
