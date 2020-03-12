1. Напишите функцию min4(a, b, c, d), вычисляющую минимум четырех чисел, которая не содержит инструкции if, а использует стандартную функцию min от двух чисел. Считайте четыре целых числа и выведите их минимум.
***
2. Даны четыре действительных числа: x₁, y₁, x₂, y₂. Напишите функцию distance(x1, y1, x2, y2), вычисляющую расстояние между точками (x₁,y₁) и (x₂,y₂). Считайте четыре действительных числа и выведите результат работы этой функции.
***
3. Напишите функцию, вычисляющую длину отрезка по координатам его концов. С помощью этой функции напишите программу, вычисляющую периметр треугольника по координатам трех его вершин.
Формат ввода
На вход программе подается 6 целых чисел — координат x₁, y₁, x₂, y₂, x₃, y₃ вершин треугольника. Все числа по модулю не превосходят 30 000.
Формат вывода
Выведите значение периметра этого треугольника с точностью до 6 знаков после десятичной точки.
```
x1 = float(input())
y1 = float(input())
x2 = float(input())
y2 = float(input())
x3 = float(input())
y3 = float(input())



def distance(x1, y1, x2, y2, x3, y3):
    a = ((x2 - x1)**2 + (y2 - y1)**2) ** 0.5 #вычисляем длины сторон
    b = ((x3 - x2)**2 + (y3 - y2)**2) ** 0.5
    c = ((x3 - x1)**2 + (y3 - y1)**2) ** 0.5
    return float('{:.6f}'.format(a + b + c)) #складываем стороны треугольника и оставляем число знаков поле запятой 6
print(distance(x1, y1, x2, y2, x3, y3))
```