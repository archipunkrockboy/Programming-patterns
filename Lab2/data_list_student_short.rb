class Data_list_student_short < Data_list

  def initialize(list)
    list.each do |elem|
      raise ArgumentError, "The elements of the list must be Student_short, not #{elem.class}!" unless elem.is_a?(Student_short)
    end
    super
  end
  def get_names
    %w[Номер ФИО Гит Контакт]
  end

  protected
  def fill_row(object)
    [object.surname_and_initials, object.git, object.contact]
  end
end
