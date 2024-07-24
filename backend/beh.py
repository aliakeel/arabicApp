import matplotlib.pyplot as plt

# تحديد نقاط تمثيل الحرف (باء)
ba_points = [
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

ba_dot = (1.5, -0.5)  # النقطة الخاصة بالنقطة تحت الباء

# فصل النقاط إلى إحداثيات x و y
x_coords, y_coords = zip(*ba_points)

# إعداد الرسم البياني
plt.figure(figsize=(6, 6))
plt.plot(x_coords, y_coords, 'ro')  # رسم نقاط الباء بلون أحمر فقط بدون خطوط

# رسم النقطة كدائرة صغيرة
circle = plt.Circle(ba_dot, 0.04, color='red', fill=True)
plt.gca().add_patch(circle)

# إعداد العنوان والمحاور
plt.title(' (ب)')
plt.xlabel(' X')
plt.ylabel(' Y')

# تحديد حدود المحاور
plt.xlim(0, 3)
plt.ylim(-1, 3)

# إظهار الرسم البياني
plt.grid(True)
plt.gca().set_aspect('equal', adjustable='box')
plt.show()
