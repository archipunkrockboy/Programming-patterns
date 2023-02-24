array = [1, 2, 5, 2, 6, 8, 2, 6]
#Дан целочисленный массив. Необходимо найти индексы двух
#наименьших элементов массива.
def two_min_index_of_array(array)
  raise ArgumentError, "В массиве меньше двух элементов!" if array.size < 2
  index1 = array.index(array.min)
  array.delete_at(index1)
  index2 = array.index(array.min)
  if index2 >= index1
    [index1, index2 + 1]
  else
    [index1, index2]
  end
end

#Дан целочисленный массив. Необходимо найти все пропущенные числа.
def find_missing_numbers(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  missing_numbers = []
  (array.minmax[0]..array.minmax[1]).to_a.map{|number| missing_numbers.append(number) unless array.include?(number) }
  missing_numbers
end

#количество локальных максимумов
def local_max_count(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  count = 0
  i = 1
  array.map{|number|
    if i != array.size - 1
      if number < array[i] and array[i + 1] < array[i]
        count = count.succ
      end
      i = i.succ
    end }
  count
end

#чередуются ли целые и вещественные числа
def alternate_int_float?(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  i = 1
  array.map do |number|
    return false if array[i].class == number.class
    i += 1
  end
  true
end

#проверка на простоту
def prime?(number)
  raise ArgumentError, "The argument must be Integer!" unless number.integer?
  number.pred.downto(2).map{|i| return false if (number%i).zero?}
  true
end

#Для введенного списка посчитать среднее арифметическое непростых
# элементов, которые больше, чем среднее арифметическое простых.
def avg_not_prime_numbers(array)
  raise ArgumentError, "Array is empty!" if array.empty?
  avg_sum_prime = array.filter{|number| prime?(number)}.sum / array.filter{|number| prime?(number)}.length.to_f
  array.filter{|number| not(prime?(number))}.sum / array.filter{|number| not(prime?(number)) and number > avg_sum_prime}.length.to_f
end

def menu(methods)
  while true
    p"1 - ввод с клавиатуры"
    p"2 - чтение из файла"
    p"3 - выход"
    input = STDIN.gets.chomp.to_i
    case input
    when 1
      array = Array.new
      print "Количество элементов: "
      n = STDIN.gets.chomp.to_i
      for i in 0..n-1 do
        array[i] = STDIN.gets.chomp.to_i
      end
      p "Выберите метод: "
      method_index = STDIN.gets.chomp.to_i
      begin
        p methods[method_index].call(array)
      rescue NoMethodError
        p "There is no method with entered number"
        retry
      end
    when 2
      file = File.open("Task4/array.txt")
      array = file.readline.split(" ").map{|value| value.to_i}
      print "Выберите метод: "
      method_index = STDIN.gets.chomp.to_i
      begin
        p methods[method_index].call(array)
      rescue NoMethodError
        p "There is no method with entered number"
        retry
      end
    when 3
      break
    else
      raise ArgumentError, "There is no point with entered number"
    end
  end
end

methods = [
  method(:two_min_index_of_array),
  method(:find_missing_numbers),
  method(:local_max_count),
  method(:alternate_int_float?),
  method(:avg_not_prime_numbers)
          ]

menu(methods)

