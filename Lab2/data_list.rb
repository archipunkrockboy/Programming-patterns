# frozen_string_literal: true

class Data_list
  attr_accessor :selected_items
  def initialize(list)
    @list = list.sort
    @selected_items = []
  end

  def select(number)
    @selected_items.append(@list[number])
  end

  def get_selected
    result = []
    @list.map{|x| result << x if @selected_items.include?(x)}
    result
  end
end
