import 'package:flutter/material.dart';
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
      title: 'Mic Check One Two',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const ModalPage(),
      routes: {'/home': (_) => const ModalPage()},
    );
  }
}
