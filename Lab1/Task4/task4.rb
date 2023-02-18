array = [1, 2, 5, 2, 6, 8, 2, 6]
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

#Дан целочисленный массив. Необходимо найти все пропущенные числа.
def find_missing_numbers(array)
  return nil if array.empty?
  missing_numbers = []
  (array.minmax[0]..array.minmax[1]).to_a.map{|number| missing_numbers.append(number) unless array.include?(number) }
  missing_numbers
end

#количество локальных максимумов
def local_max_count(array)
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
  i = 1
  array.map do |number|
    return false if array[i].class == number.class
    i += 1
  end
  true
end

#проверка на простоту
def prime?(number)
  number.pred.downto(2).map{|i| return false if (number%i).zero?}
  true
end

#Для введенного списка посчитать среднее арифметическое непростых
# элементов, которые больше, чем среднее арифметическое простых.
def avg_not_prime_numbers(array)
  avg_sum_prime = array.filter{|number| prime?(number)}.sum / array.filter{|number| prime?(number)}.length.to_f
  array.filter{|number| not(prime?(number))}.sum / array.filter{|number| not(prime?(number)) and number > avg_sum_prime}.length.to_f
end

p avg_not_prime_numbers(array)


