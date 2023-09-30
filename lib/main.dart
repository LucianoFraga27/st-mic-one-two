import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/pages/curtidas_page.dart';
import 'package:mic_check_one_two/view/pages/modal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Two',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: ModalPage(),
      routes: {
        '/home': (_) => ModalPage(),
        '/curtidas': (_) => const CurtidasPage()
      },
    );
  }
}
