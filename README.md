# Sierpinski Triangle in Flutter

Welcome to the Sierpinski Triangle Flutter project! This project showcases how to create the iconic fractal pattern, the Sierpinski Triangle, using Flutter's powerful drawing capabilities. Whether you're a seasoned developer or just starting out, this project offers a fun and educational way to explore Flutter's custom painting and UI design features.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Adjusting Parameters](#adjusting-parameters)
- [Code Overview](#code-overview)
    - [Main Widgets](#main-widgets)
    - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

The Sierpinski Triangle is a famous fractal pattern that exhibits self-similarity at various scales. It's a great example of a simple rule leading to complex and fascinating results. This Flutter project allows users to generate and manipulate the Sierpinski Triangle through an intuitive mobile interface.

## Features

- **Interactive UI:** Adjust parameters in real-time to transform and explore different iterations of the Sierpinski Triangle.
- **Customizable Designs:** Change the depth of recursion and other variables to create unique fractal patterns.
- **Responsive Layout:** The app adapts seamlessly to various screen sizes and orientations for a consistent experience on any device.
- **Smooth Animations:** Enjoy fluid transitions as you tweak the parameters and see the Sierpinski Triangle evolve instantly.
- **Educational Value:** A fantastic tool for learning about fractals and recursive patterns.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/sierpinski-triangle-flutter.git
    cd sierpinski-triangle-flutter
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

After running the app, you will see a Sierpinski Triangle pattern displayed on the screen. Use the slider at the bottom to adjust the parameters and explore different designs.

### Adjusting Parameters

- **Depth of Recursion:** Controls the level of detail in the Sierpinski Triangle.

## Code Overview

### Main Widgets

- **SierpinskiTriangleDemo:** This is the main widget containing the UI elements, including the slider and the CustomPaint widget.
- **SierpinskiTrianglePainter:** A custom painter class responsible for drawing the Sierpinski Triangle on the canvas.

Here is an example of the `SierpinskiTrianglePainter` class:

```dart
class SierpinskiTrianglePainter extends CustomPainter {
  final int depth;

  SierpinskiTrianglePainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    drawTriangle(path, Offset(size.width / 2, size.height / 4), size.width / 2, depth);

    canvas.drawPath(path, paint);
  }

  void drawTriangle(Path path, Offset top, double side, int depth) {
    if (depth == 0) {
      final height = side * sqrt(3) / 2;
      final left = Offset(top.dx - side / 2, top.dy + height);
      final right = Offset(top.dx + side / 2, top.dy + height);
      path.moveTo(top.dx, top.dy);
      path.lineTo(left.dx, left.dy);
      path.lineTo(right.dx, right.dy);
      path.lineTo(top.dx, top.dy);
    } else {
      final halfSide = side / 2;
      final height = halfSide * sqrt(3) / 2;
      drawTriangle(path, top, halfSide, depth - 1);
      drawTriangle(path, Offset(top.dx - halfSide / 2, top.dy + height), halfSide, depth - 1);
      drawTriangle(path, Offset(top.dx + halfSide / 2, top.dy + height), halfSide, depth - 1);
    }
  }

  @override
  bool shouldRepaint(SierpinskiTrianglePainter oldDelegate) {
    return oldDelegate.depth != depth;
  }
}
```

### Customization

You can modify the `SierpinskiTrianglePainter` class to change how the Sierpinski Triangle is drawn. Adjust the `depth` parameter to see different fractal patterns. Here's how you might do it:

```dart
class SierpinskiTrianglePainter extends CustomPainter {
  final int depth;

  SierpinskiTrianglePainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing logic
  }

  @override
  bool shouldRepaint(SierpinskiTrianglePainter oldDelegate) {
    return oldDelegate.depth != depth;
  }
}
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: saadi47123@gmail.com
- GitHub: [Saad-Rajpoot](https://github.com/Saad-Rajpoot)
- LinkedIn: [Saad Rajpoot](https://www.linkedin.com/in/saad-rajpoot-b3ba85225/)

Thank you for checking out the Sierpinski Triangle Flutter project! Enjoy creating your own unique fractal patterns and feel free to share your creations with the community.