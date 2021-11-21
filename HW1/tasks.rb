a = Array.new(10){|i| rand(100)}
p 'Original array:'
p a 



p '1. Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
p a.partition.each_with_index{|j, i| i.even?}
p '--------------------------------------------------------'


p '2. Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.'
p a.partition.each_with_index{|j, i| i.odd?}
p '--------------------------------------------------------'

p '3. Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
p a.index{|i| (i > a[0]) && (i < a[-1])} ? a.index{|i| (i > a[0]) && (i < a[-1])} : '[]'
p '--------------------------------------------------------'

p '4. Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
p a.rindex{|i| (i > a[0]) && (i < a[-1])} ? a.rindex{|i| (i > a[0]) && (i < a[-1])} : '[]'
p '--------------------------------------------------------'

p '5. Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.'
p [a[0]] << a.drop(1).reverse. drop(1).reverse.map{|i| i%2 == 0 ? i = i + a.first : i} << a[-1]
p '--------------------------------------------------------'

p '6. Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.'
p [a[0]] << a.drop(1).reverse. drop(1).reverse.map{|i| i%2 == 0 ? i = i + a.last : i} << a[-1]
p '--------------------------------------------------------'

p '7. Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.'
p [a[0]] << a.drop(1).reverse. drop(1).reverse.map{|i| i%2 == 1 ? i = i + a.last : i} << a[-1]
p '--------------------------------------------------------'

p '8. Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять.'
p [a[0]] << a.drop(1).reverse. drop(1).reverse.map{|i| i%2 == 1 ? i = i + a.first : i} << a[-1]
p '--------------------------------------------------------'

p '9. Дан целочисленный массив. Заменить все положительные элементы на значение минимального.'
p a.map{|i| i > 0 ? i = a.min : i}
p '--------------------------------------------------------'

p '10. Дан целочисленный массив. Заменить все положительные элементы на значение максимального.'
p a.map{|i| i > 0 ? i = a.max : i}
p '--------------------------------------------------------'

p '11. Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.'
p a.map{|i| i < 0 ? i = a.min : i}
p '--------------------------------------------------------'

p '12. Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'
p a.map{|i| i < 0 ? i = a.max : i}
p '--------------------------------------------------------'

p '13. Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию.'
p a.drop(1) << a.first
p '--------------------------------------------------------'

p '14. Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.'
p [a.last] << a.reverse.drop(1).reverse
p '--------------------------------------------------------'

=begin
p '15. Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil.'
if a == (a.first..a.last).step((a.last - a.first)/(a.length - 1)).to_a
  p (a.last - a.first)/(a.length - 1)
else 
  p nil
end
p 'Проверка на маленьком массиве:'
b = [1, 3, 5, 7, 9]
if b == (b.first..b.last).step((b.last - b.first)/(b.length - 1)).to_a
  p (b.last - b.first)/(b.length - 1)
else 
  p nil
end
p '--------------------------------------------------------'
=end

=begin
p '16. Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil.'
if a == (a.first..a.last).step(a.last / a.reverse.drop(1).reverse.last).to_a
  p (a.last / a.reverse.drop(1).reverse.last)
else 
  p nil
end
p 'Проверка на маленьком массиве:'
b = [1, 2, 4, 8, 16]
if b == (b.first..b.last).step(b.last / b.reverse.drop(1).reverse.last).to_a
  p (b.last / b.reverse.drop(1).reverse.last)
else 
  p nil
end
p '--------------------------------------------------------'
=end

p '17. Дан целочисленный массив. Найти количество его локальных максимумов.'
k = 0
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    k += 1
  end
end
p k
p '--------------------------------------------------------'

p '18. Дан целочисленный массив. Найти количество его локальных минимумов.'
k = 0
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    k += 1
  end
end
p k
p '--------------------------------------------------------'

p '19. Дан целочисленный массив. Найти максимальный из его локальных максимумов.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << a[i]
    max = m.max
  end
end
p max
p '--------------------------------------------------------'

p '20. Дан целочисленный массив. Найти минимальный из его локальных минимумов.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << a[i]
    min = m.min
  end
end
p min
p '--------------------------------------------------------'

=begin
p '21. Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.'
k = 0
m = []
for i in 1..a.length - 1
  while (a[i - 1] < a[i]) do
    m << a[i]
  end
  k += 1
end
p k
p '--------------------------------------------------------'

p '22. Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно убывают.'

p '--------------------------------------------------------'
=end

p '23. Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу.'
b = Array.new(10){rand()}
r = rand()
e = b.min_by{|i| (i - r).abs()}
p b 
p r
p e
p '--------------------------------------------------------'

p '24. Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу.'
b = Array.new(10){rand()}
r = rand()
e = b.max_by{|i| (i - r).abs}
p b 
p r
p e
p '--------------------------------------------------------'

p '25. Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.'
b = []
for i in 0..a.length - 1
  if a[i] > 0
    b << 0 << a[i]
  end
end
p b
p '--------------------------------------------------------'

p '26. Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.'
b = []
for i in 0..a.length - 1
  if a[i] < 0
    b << 0 << a[i]
  else 
    b = a
  end
end
p b
p '--------------------------------------------------------'

p '27. Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.'
b = []
for i in 0..a.length - 1
  if a[i] > 0
    b << a[i] << 0
  else 
    b = a
  end
end
p b
p '--------------------------------------------------------'

p '28. Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.'
b = []
for i in 0..a.length - 1
  if a[i] < 0
    b << a[i] << 0
  else 
    b = a
  end
end
p b
p '--------------------------------------------------------'

p '29. Дан целочисленный массив. Упорядочить его по возрастанию.'
p a.sort
p '--------------------------------------------------------'

p '30. Дан целочисленный массив. Упорядочить его по убыванию.'
p a.sort.reverse
p '--------------------------------------------------------'

p '31. Дан целочисленный массив. Упорядочить его по убыванию.'
p a.sort.reverse
p '--------------------------------------------------------'

p '32. Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.'
p a.each_with_index.sort.reverse.map(&:last)
p '--------------------------------------------------------'

p '33. Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность.'
p a.each_with_index.sort.map(&:last)
p '--------------------------------------------------------'

p '34. Дан целочисленный массив. Найти индекс минимального элемента.'
p a.index(a.min)
p '--------------------------------------------------------'

p '35. Дан целочисленный массив. Найти индекс максимального элемента.'
p a.index(a.max)
p '--------------------------------------------------------'

p '36. Дан целочисленный массив. Найти индекс первого минимального элемента.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p m.first
p '--------------------------------------------------------'

p '37. Дан целочисленный массив. Найти индекс первого максимального элемента.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p m.first
p '--------------------------------------------------------'

p '38. Дан целочисленный массив. Найти индекс последнего минимального элемента.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p m.last
p '--------------------------------------------------------'

p '39. Дан целочисленный массив. Найти индекс последнего максимального элемента.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p m.last
p '--------------------------------------------------------'

p '40. Дан целочисленный массив. Найти количество минимальных элементов.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p m.count
p '--------------------------------------------------------'

p '41. Дан целочисленный массив. Найти количество максимальных элементов.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p m.count
p '--------------------------------------------------------'

p '42. Дан целочисленный массив. Найти минимальный четный элемент.'
p a.select{|i| i.even?}.min
p '--------------------------------------------------------'

p '43. Дан целочисленный массив. Найти минимальный нечетный элемент.'
p a.select{|i| i.odd?}.min
p '--------------------------------------------------------'

p '44. Дан целочисленный массив. Найти максимальный четный элемент.'
p a.select{|i| i.even?}.max
p '--------------------------------------------------------'

p '45. Дан целочисленный массив. Найти максимальный нечетный элемент.'
p a.select{|i| i.odd?}.max
p '--------------------------------------------------------'

p '46. Дан целочисленный массив. Найти минимальный положительный элемент.'
p a.select{|i| i > 0}.min
p '--------------------------------------------------------'

p '47. Дан целочисленный массив. Найти максимальный отрицательный элемент.'
p a.select{|i| i < 0}.max
p '--------------------------------------------------------'

p '48. Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.'
r = Range.new(15, 45)
p a.select{|i| i > r.first && i < r.last}.min
p '--------------------------------------------------------'

p '49. Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале.'
r = Range.new(15, 45)
p a.select{|i| i > r.first && i < r.last}.max
p '--------------------------------------------------------'

p '50. Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным.'
p 'локальные минимальные'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p m.first

=begin
p 'минимальные равны'
k = 0
for i in 0..a.length - 1
  if a.first != a.min 
    a.drop(1)
    k += 1
  end
p k
end
=end

p '--------------------------------------------------------'

p '51. Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p m.first
p '--------------------------------------------------------'

p '52. Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p a.length - 1 - m.count
p '--------------------------------------------------------'

p '53. Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p a.length - 1 - m.count
p '--------------------------------------------------------'

p '54. Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p m.last
p '--------------------------------------------------------'

p '55. Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p m.last
p '--------------------------------------------------------'

p '56. Дан целочисленный массив. Найти количество элементов, расположенных после последнего максимального.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] < a[i]) && (a[i] > a[i + 1])
    m << i
  end
end
p a.length - 1 - m.last
p '--------------------------------------------------------'

p '57. Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального.'
m = []
for i in 1..a.length - 2
  if (a[i - 1] > a[i]) && (a[i] < a[i + 1])
    m << i
  end
end
p a.length - 1 - m.last
p '--------------------------------------------------------'

p '58. Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.'
m = []
for i in 0..a.length - 1
  if a[i] == a.min || a[i] == a.max
    m << i
    p m.first
  end
end
p '--------------------------------------------------------'

p '59. Дан целочисленный массив. Найти индекс последнего экстремального (то есть минимального или максимального) элемента.'
#p a.rindex(a.min || a.max)
m = []
for i in 0..a.length - 1
  if a[i] == a.min || a[i] == a.max
    m << i
    p m.last
  end
end
p '--------------------------------------------------------'

p '60. Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.'

m = []
for i in 0..a.length - 1
  if a[i] == a.min
    m << i
    p m.index(m.last).to_i - m.index(m.first).to_i - 1
  end
end
p '--------------------------------------------------------'

p '61. Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.'

m = []
for i in 0..a.length - 1
  if a[i] == a.max
    m << i
    p m.index(m.last).to_i - m.index(m.first).to_i - 1
  end
end
p '--------------------------------------------------------'

p '62. Дан целочисленный массив. Найти два наибольших элемента.'
p a.sort.reverse.slice(0, 2)
p '--------------------------------------------------------'

p '63. Дан целочисленный массив. Найти два наименьших элемента.'
p a.sort.slice(0, 2)
p '--------------------------------------------------------'

p '64. Дан целочисленный массив. Найти максимальное количество подряд идущих минимальных элементов.'
p a.min
p 
p '--------------------------------------------------------'

p '65. Дан целочисленный массив. Найти максимальное количество подряд идущих максимальных элементов.'

p '--------------------------------------------------------'

p '66. Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные.'
p a.select{|i| i.even?} << a.select{|i| i.odd?}
p '--------------------------------------------------------'

p '67. Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.'
p a.select{|i| i.odd?} << a.select{|i| i.even?}
p '--------------------------------------------------------'

p '68. Дан целочисленный массив. Проверить, чередуются ли в нем четные и нечетные числа.'
for i in 1..a.length - 1
  if a[i].odd? && a[i].next.even?
    p 'y'
  elsif a[i].even? && a[i].next.odd?
    p 'y'
  else
    p 'n'
  end
end  
p '--------------------------------------------------------'

p '69. Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа.'
for i in 1..a.length - 1
  if a[i] > 0 && a[i].next < 0
    p 'y'
  elsif a[i] < 0 && a[i].next > 0
    p 'y'
  else
    p 'n'
  end
end  
p '--------------------------------------------------------'

p '70. Дано вещественное число R и массив вещественных чисел. Найти два элемента массива, сумма которых наиболее близка к данному числу.'

p '--------------------------------------------------------'

p '71. Дано вещественное число R и массив вещественных чисел. Найти два элемента массива, сумма которых наименее близка к данному числу.'

p '--------------------------------------------------------'

c = Array.new(10){|i| rand(100)}

p '72. Дан целочисленный массив. Удалить все элементы, встречающиеся менее двух раз.'
c = Array.new(10){|i| rand(100)}
p c.delete_if{|i| c.count(i) < 2}
p 'check'
b = [1, 1, 2, 3, 5, 5, 4]
p b.delete_if{|i| b.count(i) < 2}
p '--------------------------------------------------------'

p '73. Дан целочисленный массив. Удалить все элементы, встречающиеся более двух раз.'
c = Array.new(10){|i| rand(100)}
p c.delete_if{|i| c.count(i) >= 3}
p 'check'
b = [1, 1, 1, 2, 3, 5, 5, 4]
p b.delete_if{|i| b.count(i) >= 3}
p '--------------------------------------------------------'

p '74. Дан целочисленный массив. Удалить все элементы, встречающиеся ровно два раза.'
c = Array.new(10){|i| rand(100)}
p c.delete_if{|i| c.count(i) == 2}
p 'check'
b = [1, 1, 2, 3, 5, 5, 4]
p b.delete_if{|i| b.count(i) == 2}
p '--------------------------------------------------------'

p '75. Дан целочисленный массив. Удалить все элементы, встречающиеся ровно три раза.'
c = Array.new(10){|i| rand(100)}
p c.delete_if{|i| c.count(i) == 3}
p 'check'
b = [1, 1, 2, 3, 5, 5, 5, 4]
p b.delete_if{|i| b.count(i) == 3}
p '--------------------------------------------------------'

a = Array.new(10){|i| rand(100)}

p '76. Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.'
p a
p a.sum{|i| i.abs} / a.length
p '--------------------------------------------------------'

p '77. Дан целочисленный массив. Найти среднее арифметическое квадратов его элементов.  '
p a.sum{|i| i * i} / a.length
p '--------------------------------------------------------'

p '78. Дано целое число. Найти сумму его цифр.'
d = rand(1000)
p d
p d.to_s.chars.map{|i| i.to_i}.sum
p '--------------------------------------------------------'

p '79. Дано целое число. Найти произведение его цифр.'
d = rand(1000)
p d
p d.to_s.chars.map{|i| i.to_i}.reduce(:*)
p '--------------------------------------------------------'

p '80. Дан целочисленный массив. Возвести в квадрат отрицательные элементы и в третью степень - положительные. Нулевые элементы - не изменять.'
v = a.map{|i| i > 0 ? i*i*i : i*i}
p v
p '--------------------------------------------------------'

p '81. Дан дипапазон a..b. Получить массив из чисел, расположенных в этом диапазоне (исключая сами эти числа), в порядке их возрастания, а также размер этого массива.  '
x = (17..69)
p x
p a.select{|i| x.include?(i)}.sort
p a.select{|i| x.include?(i)}.sort.count
p '--------------------------------------------------------'

p '82. Дан дипапазон a..b. Получить массив из чисел, расположенных в этом диапазоне (исключая сами эти числа), в порядке их убывания, а также размер этого массива.'
x = (17..69)
p x
p a.select{|i| x.include?(i)}.sort.reverse
p a.select{|i| x.include?(i)}.sort.count
p '--------------------------------------------------------'

p '83. Дано число А и натуральное число N. Найти результат следующего выражения 1 + А + А*2 + А*3 + … + А*N.'
n = rand(10)
m = rand(100)
p (m-1..n-1).inject(1 + m + m*2 + m*3) {|i, j| i + m*j}
p '--------------------------------------------------------'

p '84. Дано число А и натуральное число N. Найти результат следующего выражения 1 - А + А*2 - А*3 + … + ((-1)**N)*А*N.  '
n = rand(10)
m = rand(100)
p (m-1..n-1).inject(1 - m + m*2 - m*3) {|i, j| i + ((-1)**j)*m*j}
p '--------------------------------------------------------'

p '85. Дано натуральное число N. Найти результат следующего произведения 1*2*…*N.'
n = rand(10)
p n
p n.step(1, -1).reduce(:*)
p '--------------------------------------------------------'

p '86. Дано натуральное число N. Если N - нечетное, то найти произведение 1*3*…*N; если N - четное, то найти произведение 2*4*…*N.'
n = rand(10)
p n
p n.step(1, -2).reduce(:*)
p '--------------------------------------------------------'

p '87. Дан целочисленный массив. Найти среднее арифметическое его элементов.  '
p a.sum / a.count
p '--------------------------------------------------------'

p '88. Дан целочисленный массив. Найти все четные элементы.'
p a.select{|i| i.even?}
p '--------------------------------------------------------'

p '89. Дан целочисленный массив. Найти количество четных элементов.'
p a.select{|i| i.even?}.count
p '--------------------------------------------------------'

p '90. Дан целочисленный массив. Найти все нечетные элементы. '
p a.select{|i| i.odd?}
p '--------------------------------------------------------'

p '91. Дан целочисленный массив. Найти количество нечетных элементов.'
p a.select{|i| i.odd?}.count
p '--------------------------------------------------------'

p '92. Дан целочисленный массив и число К. Если существует элемент, меньший К, то вывести true; в противном случае вывести false.'

p '--------------------------------------------------------'

p '93. Дан целочисленный массив и число К. Если существует элемент, больший К, то вывести true; в противном случае вывести false.'

p '--------------------------------------------------------'

p '94. Дан целочисленный массив и число К. Если все элементы массива меньше К, то вывести true; в противном случае вывести false.'

p '--------------------------------------------------------'

p '95. Дан целочисленный массив и число К. Если все элементы массива больше К, то вывести true; в противном случае вывести false.'

p '--------------------------------------------------------'

p '96. Дан целочисленный массив и число К. Вывести количество элементов, меньших К. '
k = rand(100)
p k
p a.select{|i| i < k}.count
p a
p '--------------------------------------------------------'

p '97. Дан целочисленный массив и число К. Вывести индекс первого элемента, большего К. '
k = rand(100)
p k
p a
p a.index(a.select{|i| i > k}.first)
p '--------------------------------------------------------'

p '98. Дан целочисленный массив и число К. Вывести индекс последнего элемента, меньшего К.'
k = rand(100)
p k
p a
p a.index(a.select{|i| i < k}.last)
p '--------------------------------------------------------'

p '99. Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел.'

p '--------------------------------------------------------'

p '100. Дан целочисленный массив. Вывести индексы элементов, которые меньше своего правого соседа, и количество таких чисел.'

p '--------------------------------------------------------'

p '101. Дан целочисленный массив. Вывести индексы элементов, которые больше своего правого соседа, и количество таких чисел.  '

p '--------------------------------------------------------'
