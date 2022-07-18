import 'package:flutter/material.dart';
import 'package:temporizador_app/pages/timer_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6DEAFF),
        colorScheme: const ColorScheme.light(
          secondary: Color(0xFF484A7E),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
