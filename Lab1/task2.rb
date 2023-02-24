#количество взаимно простых чисел
def count_mutually_prime_numbers(number)
  raise ArgumentError, "The argument must be Integer!" unless number.integer?
  count = 0
  (number).pred.downto(2).each {|number1| count += 1 if number.gcd(number1) == 1}
  count
end

#сумма цифр числа, которые делятся на 3
def sum_digit_div_3(number)
  raise ArgumentError, "The argument must be Integer!" unless number.integer?
  sum_digit = 0
  number.digits.each {|digit| sum_digit += digit if (digit%3).zero?}
  sum_digit
end

=begin
number - число, цифры которого будут проверяться на взаимную простоту с number1
number1 - число, которое будет проверяться на взаимную простоту с каждой цифрой из digits
=end
def count_mutually_prime_dig_with_number(number, number1)
  raise ArgumentError, "The argument must be Integer!" unless (number.integer?) and (number1.integer?)
  count = 0
  number.digits.each {|digit| count += 1 if number1.gcd(digit) == 1}
  count
end
#делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа
def div_mutually_prime_with_max_count_dig(number)
  raise ArgumentError, "The argument must be Integer!" unless number.integer?
  current_divider = nil
  max_count = 0
  number.pred.downto(2).each do |i|
    if (number%i).zero?
      current_count = count_mutually_prime_dig_with_number(number, i)
      (max_count = current_count) and (current_divider = i) if current_count > max_count
    end
  end
  current_divider
end


#div_mutually_prime_with_max_count_dig(123.21)
#p sum_digit_div_3(93672)
#p div_mutually_prime_with_max_count_dig(15632)
