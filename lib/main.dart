import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sierpinski Triangle',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Sierpinski Triangle'),
          actions: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent, // Set background color to transparent if needed
              child: ClipOval(
                child: Image.asset(
                  'assets/image.jpg',
                  fit: BoxFit.cover, // Use BoxFit.cover to ensure the image covers the circular area
                  width: 50, // Ensure width and height are set to the diameter of the CircleAvatar
                  height: 50,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SierpinskiTriangleDemo(),
        ),
      ),
    );
  }
}

class SierpinskiTriangleDemo extends StatefulWidget {
  @override
  _SierpinskiTriangleDemoState createState() => _SierpinskiTriangleDemoState();
}

class _SierpinskiTriangleDemoState extends State<SierpinskiTriangleDemo> {
  int _depth = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: SierpinskiTrianglePainter(depth: _depth),
            child: Center(),
          ),
        ),
        Slider(
          min: 1,
          max: 7,
          divisions: 6,
          label: 'Depth: $_depth',
          value: _depth.toDouble(),
          onChanged: (value) {
            setState(() {
              _depth = value.toInt();
            });
          },
        ),
      ],
    );
  }
}

class SierpinskiTrianglePainter extends CustomPainter {
  final int depth;

  SierpinskiTrianglePainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double width = size.width;
    double height = size.height;
    double sideLength = min(width, height);

    final path = Path();
    final points = [
      Offset(width / 2, height / 2 - sideLength / (2 * sqrt(3))),
      Offset(width / 2 - sideLength / 2, height / 2 + sideLength / (2 * sqrt(3))),
      Offset(width / 2 + sideLength / 2, height / 2 + sideLength / (2 * sqrt(3))),
    ];

    _drawTriangle(path, points, depth);

    canvas.drawPath(path, paint);
  }

  void _drawTriangle(Path path, List<Offset> points, int depth) {
    if (depth == 0) {
      path.moveTo(points[0].dx, points[0].dy);
      path.lineTo(points[1].dx, points[1].dy);
      path.lineTo(points[2].dx, points[2].dy);
      path.lineTo(points[0].dx, points[0].dy);
    } else {
      final midPoints = [
        Offset((points[0].dx + points[1].dx) / 2, (points[0].dy + points[1].dy) / 2),
        Offset((points[1].dx + points[2].dx) / 2, (points[1].dy + points[2].dy) / 2),
        Offset((points[2].dx + points[0].dx) / 2, (points[2].dy + points[0].dy) / 2),
      ];

      _drawTriangle(path, [points[0], midPoints[0], midPoints[2]], depth - 1);
      _drawTriangle(path, [midPoints[0], points[1], midPoints[1]], depth - 1);
      _drawTriangle(path, [midPoints[2], midPoints[1], points[2]], depth - 1);
    }
  }

  @override
  bool shouldRepaint(SierpinskiTrianglePainter oldDelegate) {
    return oldDelegate.depth != depth;
  }
}