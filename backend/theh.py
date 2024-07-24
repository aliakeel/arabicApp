import matplotlib.pyplot as plt

# تحديد نقاط تمثيل الحرف (تاء)
theh_points = [
    (0.5, 1),    # النقطة 1
    (0.5, 0.5),  # النقطة 2
    (0.5, 0),    # النقطة 3
    (1, 0),      # النقطة 4
    (1.5, 0),    # النقطة 5
    (2, 0),      # النقطة 6
    (2.5, 0),    # النقطة 7
    (2.5, 0.5),  # النقطة 8
    (2.5, 1)     # النقطة 9
]

theh_dot1 = (1.25, 1.5)  # النقطة الأولى فوق الثاء
theh_dot2 = (1.75, 1.5)  # النقطة الثانية فوق الثاء
theh_dot3 = (1.5, 2)     # النقطة الثالثة فوق الثاء
# فصل النقاط إلى إحداثيات x و y
x_coords, y_coords = zip(*theh_points)

# إعداد الرسم البياني
plt.figure(figsize=(6, 6))
plt.plot(x_coords, y_coords, 'ro')  # رسم نقاط الثاء بلون أحمر فقط بدون خطوط

# رسم النقاط كدوائر صغيرة
circle1 = plt.Circle(theh_dot1, 0.04, color='red', fill=True)
plt.gca().add_patch(circle1)
circle2 = plt.Circle(theh_dot2, 0.04, color='red', fill=True)
plt.gca().add_patch(circle2)
circle3 = plt.Circle(theh_dot3, 0.04, color='red', fill=True)
plt.gca().add_patch(circle3)
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
