#Сумма цифр числа, которые делятся на 3
def sum_digit_div_3(number)
  sum_digit = 0
  number.digits.each {|digit| sum_digit += digit if (number%3).zero?}
  sum_digit
end


p sum_digit_div_3(12)


