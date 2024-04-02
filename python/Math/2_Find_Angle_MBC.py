import math

ab = int(input())
bc = int(input())

hypo = math.sqrt(ab**2 + bc**2)
angle = math.degrees(math.asin(ab/hypo))

print(f"{round(angle)}\N{DEGREE SIGN}")