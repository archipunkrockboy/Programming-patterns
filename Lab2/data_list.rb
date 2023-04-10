# frozen_string_literal: true

class Data_list
  attr_reader :selected_items
  def initialize(list)
    self.list = list #list.sort
    @selected_items = []
  end

  def select(number)
    selected_items.append(list[number].id)
  end

  def delete_selected
    @selected_items = []
  end
  def get_data
    result = []
    index = 1
    list.each do |object|
      result << fill_row(object).insert(0, index)
      index += 1
    end
    Data_table.new(result)
  end
  def list=(list)
    raise ArgumentError, "The argument must be Array, not #{list.class}!" unless list.is_a?(Array)
    @list = list
  end

  protected
  #возвращает список значений аттрибутов, кроме id, необходимо переопределять в наследниках
  def fill_row(object)
    []
  end
  def get_names
    []
  end

  private
  attr_reader :list
end
