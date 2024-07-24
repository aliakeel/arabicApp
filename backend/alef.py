import matplotlib.pyplot as plt

# تحديد نقاط تمثيل الحرف (الف)
alef_points = [
    (1.5, 0.5),    # النقطة 1
    (1.5, 1),      # النقطة 2
    (1.5, 1.5),    # النقطة 3
    (1.5,2),      # النقطة 4
    (1.5, 0),      # النقطة 5
]

alef_dot1 = (1.5, 2.90)  # النقطة الأولى فوق الألف
alef_dot2 = (1, 2.75)  # النقطة الثانية فوق الألف
alef_dot3 = (1.5, 2.5)  # النقطة الثالثة فوق الألف
alef_dot4 = (1, 2.25)  # النقطة الرابعة فوق الألف

# فصل النقاط إلى إحداثيات x و y
x_coords, y_coords = zip(*alef_points)

# إعداد الرسم البياني
plt.figure(figsize=(6, 6))
plt.plot(x_coords, y_coords, 'ro')  # رسم نقاط الألف بلون أحمر فقط بدون خطوط

# رسم النقاط كدوائر صغيرة
circle1 = plt.Circle(alef_dot1, 0.04, color='red', fill=True)
plt.gca().add_patch(circle1)
circle2 = plt.Circle(alef_dot2, 0.04, color='red', fill=True)
plt.gca().add_patch(circle2)
circle3 = plt.Circle(alef_dot3, 0.04, color='red', fill=True)
plt.gca().add_patch(circle3)
circle4 = plt.Circle(alef_dot4, 0.04, color='red', fill=True)
plt.gca().add_patch(circle4)

# إعداد العنوان والمحاور
plt.title(' (ث) ')
plt.xlabel(' X')
plt.ylabel(' Y')

# تحديد حدود المحاور
plt.xlim(0, 3)
plt.ylim(-1, 3)

# إظهار الرسم البياني
plt.grid(True)
plt.gca().set_aspect('equal', adjustable='box')
plt.show()
