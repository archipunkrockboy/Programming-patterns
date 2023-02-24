#ruby task3.rb 0  "array.txt"

def min_element(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  min_element = array[0]
  for element in array do
    min_element = element if element < min_element
  end
  min_element
end

def max_element(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  max_element = array[0]
  i = 0
  while i < array.size do
    max_element = array[i] if array[i] > max_element
    i = i.succ
  end
  max_element
end

def find_first_positive_element_index(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  for i in 0..array.size-1 do
    return i if array[i] > 0
  end
  nil
end

raise ArgumentError, "Count of arguments must be == 2" if ARGV.size != 2

methods = [method(:min_element), method(:max_element), method(:find_first_positive_element_index)]
method_names = ["минимальный элемент массива", "максимальный элемент массива", "индекс первого положительного элемента массива"]
method_index = ARGV[0].to_i
file_path = ARGV[1]

raise ArgumentError, "There is no method with number #{method_index}" unless method_index.between?(0, methods.size-1)

file = File.open(file_path)
array = file.readline.split(' ').map{|value| value.to_i}

p "Исходный массив: #{array}"
p "#{method_names[method_index]}: #{methods[method_index].call(array)}"
