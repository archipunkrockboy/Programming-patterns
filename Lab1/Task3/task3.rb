#минимальный элемент массива
def min_element(array)
  nil if array.empty?
  min_element = array[0]
  for element in array do
    min_element = element if element < min_element
  end
  min_element
end

def max_element(array)
  nil if array.empty?
  max_element = array[0]
  i = 0
  while i < array.size do
    max_element = array[i] if array[i] > max_element
    i = i.succ
  end
  max_element
end

def first_positive_element_index(array)
  nil if array.empty?
  for i in 0..array.size-1 do
    return i if array[i] > 0
  end
  i
end

p min_element([-5, 2, 4, -11])
p max_element([-2, 10, -4, 11])
p first_positive_element_index([4, -3, 4])
