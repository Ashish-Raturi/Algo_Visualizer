import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class StickPainter extends CustomPainter {
  List<int> lines;
  List<int> coloredIndex;
  List<int> swapedIndex;
  String algoDropdownValue;
  bool swap;
  bool swapColor;
  double width;
  double height;
  StickPainter(
      {this.lines,
      this.width,
      this.height,
      this.coloredIndex,
      this.swap,
      this.swapColor,
      this.swapedIndex,
      this.algoDropdownValue});

  @override
  void paint(Canvas canvas, Size size) {
    double w = 20;
    double h = height / 5;

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    //stick paint

    _selectionSort() {
      w = 20;
      for (int i = 0; i < lines.length; i++) {
        if (coloredIndex[0] != -1) {
          if ((swapedIndex[0] == i || swapedIndex[1] == i) && swap) {
            paint.color = Colors.pink;
          } else if ((coloredIndex[0] == i || coloredIndex[1] == i) && !swap) {
            paint.color = Colors.blue;
            if (swapColor && coloredIndex[1] == i) {
              paint.color = Colors.pink;
              canvas.drawLine(Offset(w, h - lines[i]), Offset(w, h), paint);
            }
          } else {
            paint.color = Colors.black;
          }
        }

        canvas.drawLine(Offset(w, h - lines[i]), Offset(w, h), paint);
        w += (width - 30) / lines.length;
      }
    }

    _bubbleShort() {
      w = 20;
      for (int i = 0; i < lines.length; i++) {
        if (coloredIndex[0] != -1) {
          if (coloredIndex[0] == i || coloredIndex[1] == i) {
            if (!swap) {
              paint.color = Colors.blue;
            } else {
              paint.color = Colors.pink;
            }
          } else {
            paint.color = Colors.black;
          }
        }
        canvas.drawLine(Offset(w, h - lines[i]), Offset(w, h), paint);
        w += (width - 30) / lines.length;
      }
    }

    _insertionSort() {
      w = 20;
      for (int i = 0; i < lines.length; i++) {
        if (coloredIndex[0] == i) {
          paint.color = Colors.blue;
        } else if (coloredIndex[1] == i) {
          paint.color = Colors.pink;
        } else {
          paint.color = Colors.black;
        }

        canvas.drawLine(Offset(w, h - lines[i]), Offset(w, h), paint);
        w += (width - 30) / lines.length;
      }
    }

    switch (algoDropdownValue) {
      case 'Bubble Sort':
        _bubbleShort();
        break;

      case 'Selection Sort':
        _selectionSort();
        break;

      case 'Insertion Sort':
        _insertionSort();
        break;
    }
    //Text paint
    final textStyle =
        ui.TextStyle(color: Colors.black, fontSize: 18.0, wordSpacing: 1.5);
    final paragraphStyle = ui.ParagraphStyle(textDirection: TextDirection.ltr);
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle);

    for (int i = 0; i < lines.length; i++) {
      paragraphBuilder.addText("${lines[i]}  ");
    }
    final constraints = ui.ParagraphConstraints(width: double.infinity);

    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(10, height / 5 + 15.0);
    canvas.drawParagraph(paragraph, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
