
class Data_table
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

  private
  attr_reader :table
end
