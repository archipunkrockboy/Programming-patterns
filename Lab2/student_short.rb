require "json"
class Student_short
  attr_reader :surname_and_initials, :id, :git, :contact
  def initialize(id, str)
    args = Student_short.get_hash(str)
    @id = id
    @surname_and_initials = args["surname_and_initials"]
    @git = args["git"]
    @contact = args["contact"]
  end
  def self.initialize_from_student(student)
    raise ArgumentError, "The argument must be Student, not #{student.class}!" unless student.is_a?(Student)
    Student_short.new(student.id, student.get_info)
  end

  def self.get_hash(str)
    begin
      hash = JSON.parse(str)
      raise ArgumentError, "#{str} doesn't contain information about student!" if hash.nil?
      hash
    rescue JSON::ParserError
      p "Unable to extract data from #{str}"
    end
  end

  def validate?
    has_git? && has_contact?
  end

  def has_contact?
    !contact.nil?
  end

  def has_git?
    !git.nil?
  end

end
