require_relative 'data_list'
require_relative 'data_list_student_short'
class Data_table
  attr_reader :table
  def initialize(table)
    @table = table
  end

  def get_value(i, j)
    begin
      table[i][j]
    rescue NoMethodError
      p "There is no element with index [#{i}, #{j}]"
    end
  end

  def rows_count
    table.size
  end

  def columns_count
    raise NoMethodError, "The table is empty!" if table.empty?
    table[0].size
  end


end
