import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kaleela/res/colors.dart';

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  // PictureRecorder recorder = PictureRecorder();
  // Canvas canvas;
  List<DrawingPoint> drawingPoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Stack(
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: _DrawingPainter(drawingPoints),
                child: GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      drawingPoints.add(
                        DrawingPoint(
                          details.localPosition,
                          Paint()
                            ..color = selectedColor
                            ..isAntiAlias = true
                            ..strokeWidth = strokeWidth
                            ..strokeCap = StrokeCap.round,
                        ),
                      );
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      drawingPoints.add(
                        DrawingPoint(
                          details.localPosition,
                          Paint()
                            ..color = selectedColor
                            ..isAntiAlias = true
                            ..strokeWidth = strokeWidth
                            ..strokeCap = StrokeCap.round,
                        ),
                      );
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      drawingPoints.add(DrawingPoint(details.localPosition,
                          Paint()..color = Colors.transparent));
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 25,
                right: 25,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      drawingPoints.clear();
                    });
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(color: purple, shape: BoxShape.circle),
                    child: Icon(
                      Icons.restart_alt,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;

  _DrawingPainter(this.drawingPoints);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
        canvas.drawLine(
          drawingPoints[i].offset,
          drawingPoints[i + 1].offset,
          drawingPoints[i].paint,
        );
      } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [drawingPoints[i].offset],
          drawingPoints[i].paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset offset;
  Paint paint;

  DrawingPoint(this.offset, this.paint);
}
