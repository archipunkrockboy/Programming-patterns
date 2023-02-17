array = [1, 7, 8, 0, 1, 4, 6, 2]
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

p two_min_index_of_array(array)