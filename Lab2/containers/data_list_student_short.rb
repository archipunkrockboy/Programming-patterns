require_relative '../gui/main_window'
require_relative '../gui/student_list_controller'
require_relative 'data_list'
class Data_list_student_short < Data_list
  attr_accessor :observers
  def initialize(list)
    list.each do |elem|
      raise ArgumentError, "The elements of the list must be Student_short, not #{elem.class}!" unless elem.is_a?(Student_short)
    end
    @observers = []
    super
  end
  def get_names
    %w[Номер ФИО Гит Контакт]
  end

  #регистрация наблюдателя
  def observer_registration(observer)
    self.observers.append(observer)
  end

  #удаление наблюдателя
  def delete_observer(observer)
    self.observers.delete(observer)
  end
  def list=(list)
    super
    notify_all
  end
  def notify_all
    if self.observers
      self.observers.each do |observer|
        observer.set_table_parameters(get_names, self.list.length)
        observer.set_table_data(self.get_data)
      end
    end
  end

  protected
  def fill_row(object)
    [object.surname_and_initials, object.git, object.contact]
  end
end
