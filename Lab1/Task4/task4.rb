array = [1, 7, 8, 0, 1, 4, 6, 2]
#Дан целочисленный массив. Необходимо найти индексы двух
#наименьших элементов массива.
def two_min_index_of_array(array)
  return nil if array.empty?
  return array[0] if array.size == 1
  index1 = array.index(array.min)
  array.delete_at(index1)
  index2 = array.index(array.min)
  if index2 >= index1
    [index1, index2 + 1]
  else
    [index1, index2]
  end
end

def find_missing_numbers(array)
  return nil if array.empty?
  missing_numbers = []
  (array.minmax[0]..array.minmax[1]).to_a.map{|number| missing_numbers.append(number) unless array.include?(number) }
  missing_numbers
end

p find_missing_numbers(array)