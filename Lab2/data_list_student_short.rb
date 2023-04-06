class Data_list_student_short < Data_list

  def initialize(list)
    list.each do |elem|
      raise ArgumentError, "The elements of the list must be Student_short, not #{elem.class}!" unless elem.is_a?(Student_short)
    end
    super
  end
  def get_names
    ["surname and initials", "git", "contact"]
  end
  def get_data
    result = []
    id = 0
    list.each do |sh|
      result << [id, sh.surname_and_initials, sh.git, sh.contact]
      id += 1
    end
    Data_table.new(result)
  end


end
