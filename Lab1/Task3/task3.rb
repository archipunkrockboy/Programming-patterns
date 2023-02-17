#ruby task3.rb 0  "array.txt"

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

def find_first_positive_element_index(array)
  nil if array.empty?
  for i in 0..array.size-1 do
    return i if array[i] > 0
  end
  nil
end

if ARGV.size != 2
  p"Некорректный ввод аргументов!"
  return
end

methods = [method(:min_element), method(:max_element), method(:find_first_positive_element_index)]
method_names = ["минимальный элемент массива", "максимальный элемент массива", "индекс первого положительного элемента массива"]
method_index = ARGV[0].to_i
file_path = ARGV[1]

unless method_index.between?(0, methods.size-1)
  p"нет метода с введённым номером!"
  return
end

file = File.open(file_path)
array = file.readline.split(' ').map{|value| value.to_i}

p "Исходный массив: #{array}"
p "#{method_names[method_index]}: #{methods[method_index].call(array)}"
