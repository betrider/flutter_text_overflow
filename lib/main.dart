import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(isTextOverFlow(text: '가나다', textStyle: const TextStyle(fontSize: 30), maxWidth: 100));
    print(getTextHeight(text: '가나다', textStyle: const TextStyle(fontSize: 30), maxWidth: 100));
    print(isTextOverFlow(text: '가나다라', textStyle: const TextStyle(fontSize: 30), maxWidth: 100));
    print(getTextHeight(text: '가나다라', textStyle: const TextStyle(fontSize: 30), maxWidth: 100));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              color: Colors.blue,
              child: const Text(
                '가나다',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: 100,
              color: Colors.yellow,
              child: const Text(
                '가나다라',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 텍스트 오버플로우 여부 확인
bool isTextOverFlow({
  required String text,
  required TextStyle textStyle,
  required double maxWidth,
}) {
  TextSpan textSpan = TextSpan(
    text: text,
    style: textStyle,
  );

  TextPainter textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
    maxLines: 1,
  );

  textPainter.layout(
    maxWidth: maxWidth,
  );

  // whether the text overflowed or not
  bool isOverFlow = textPainter.didExceedMaxLines;

  return isOverFlow;
}

/// 텍스트 높이 가져오기
double getTextHeight({
  required String text,
  required TextStyle textStyle,
  required double maxWidth,
}) {
  TextSpan textSpan = TextSpan(
    text: text,
    style: textStyle,
  );

  TextPainter textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    maxWidth: maxWidth,
  );

  double height = textPainter.height;

  return height;
}