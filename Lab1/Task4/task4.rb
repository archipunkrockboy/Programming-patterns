array = [12, 7, 8, 0, 11, 4, 12, 11]
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

#Дан целочисленный массив. Найти количество его локальных максимумов.
# def local_max_count(array)
#   i = 1
#   array.inject(0) do |count, number|
#     if i != array.size-1
#       if number < array[i] and array[i + 1] < array[i]
#         count += 1
#         c += 1
#         p count
#       end
#       #p "##{number}    #{array[i]}    #{array[i+1]}"
#       i += 1
#     end
#   end
# end

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
