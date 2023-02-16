#количество взаимнопростых чисел
def count_mutually_prime_numbers(number)
  count = 0
  (number).pred.downto(1).each {|number1| count += 1 if number.gcd(number1) == 1}
  count
end

#Сумма цифр числа, которые делятся на 3
def sum_digit_div_3(number)
  sum_digit = 0
  number.digits.each {|digit| sum_digit += digit if (number%3).zero?}
  sum_digit
end


p sum_digit_div_3(12)
p count_mutually_prime_numbers(10)

