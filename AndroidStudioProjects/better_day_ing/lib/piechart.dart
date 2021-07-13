import 'package:flutter/material.dart';
import 'dart:math';
import 'package:better_day_ing/piechart.dart';

class Piechart extends CustomPainter{
  final int percentage;
  final double textScaleFactor;
  final int total;

  Piechart({@required this.percentage, this.textScaleFactor = 1.0, this.total});

  @override
  void paint(Canvas canvas, Size size) {
    // 화면에 그릴 paint정의
    // if (total == Null) {
    //   total = 40;
    // }
    Paint paint = Paint();
    paint.color = Colors.indigo;
    paint.strokeWidth = 15.0;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;

    // 원의 반지름을 구한다. 선의 굵기에 영향을 받지 않게 보정
    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth /2);
    // 그래프가 가운데로 그려지도록 좌표를 정한다
    Offset center = Offset(size.width/2, size.height/2);
    // 원그래프를 그린다
    canvas.drawCircle(center, radius, paint);
    // 호(arc)의 각도를 정한다. 정해진 각도만큼만 그린다.
    double arcAngle = 2*pi*(percentage/total);
    // 호를 그릴 때 색 변경
    paint.color = Colors.redAccent;
    // 호를 그린다
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, arcAngle, false, paint);
    // 텍스트를 화면에 표시
    // if (total == null) {
    //   total = 40;
    // }
    drawText(canvas, size, '$percentage/$total');

  }

  // 원의 중앙에 텍스트를 적는다
  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextSpan sp = TextSpan(
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        text: text
    );

    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);
    // 필수로 호출. 텍스트 페인터에 그려질 텍스트의 크기와 방향 결정
    tp.layout();

    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height /2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  // 화면 크기에 비례하도록 텍스트 폰트 크기를 정한다.
  double getFontSize(Size size, String text) {
    return size.width / text.length*textScaleFactor;
  }

  // 다르면 다시 그리도록
  @override
  bool shouldRepaint(Piechart old) {
    return old.percentage != percentage;
  }
}