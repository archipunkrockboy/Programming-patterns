
class Data_table
  def initialize(table)
    @table = table
  end

  def get_value(i, j)
    begin
      @table[i][j]
    rescue NoMethodError
      p "There is no element with index [#{i}, #{j}]"
    end
  end

  def rows_count
    @table.size
  end

  def columns_count(mod='max')
    if mod == 'max'
      count = 0
      @table.each do |row|
        count = row.size if row.size > count
      end
      return count
    end
    if mod == 'min'
      count = @table[0].size
      @table.each do |row|
        count = row.size if row.size < count
      end
      count
    end
    raise ArgumentError, "The argument must have the value 'max' or 'min'"
  end
end
