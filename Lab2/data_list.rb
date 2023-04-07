# frozen_string_literal: true

class Data_list
  attr_reader :selected_items
  def initialize(list)
    @list = list #list.sort
    @selected_items = []
  end

  def select(number)
    selected_items.append(list[number].id)
  end

  def get_selected
    result = []
    list.map{|x| result << x if selected_items.include?(x)}
    result
  end

  #возвращает список значений аттрибутов, кроме id, необходимо переопределять в наследниках
  def get_data
    result = []
    index = 1
    list.each do |object|
      result << fill_row(object).insert(0, index)
      index += 1
    end
    Data_table.new(result)
  end

  protected
  def fill_row(object)
    []
  end
  def get_names
    []
  end
  
  attr_reader :list
  attr_accessor :selected_items
end
