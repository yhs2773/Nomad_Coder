import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

// 에러의 원인

// 따로 User-Agent 값을 추가하지 않으면 기본값으로 `Dart/<version> (dart:io)` 가 들어갑니다.
// (https://api.flutter.dev/flutter/dart-io/HttpClient/userAgent.html)

// 이 값을 지우고 브라우저에서 사용하는 값으로 바꿔줍니다.
// (브라우저 값이 아니면 네이버에서 차단하는걸로 보입니다)

// user-agent를 추가하고 override 클래스를 만들어 사용
// 이 클래스를 사용하지 않는다면 home_screen.dart에 user-agent 주석을 풀고 사용
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  // global override로 추가
  HttpOverrides.global = MyHttpOverrides();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
