import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/view/pages/adicionar_username_foto_page.dart';
import 'package:mic_check_one_two/view/pages/curtidas_page.dart';
import 'package:mic_check_one_two/view/pages/login_page.dart';
import 'package:mic_check_one_two/view/pages/modal_page.dart';
import 'package:mic_check_one_two/view/pages/register_page.dart';
import 'package:mic_check_one_two/view/pages/upload_musica.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
      routes: {
        '/': (_) => LoginPage(),
        '/register': (_) => RegisterPage(),
        '/home': (_) => ModalPage(),
        '/adicionar-dadospessoais': (_) => SendUsernameAndImagePage(),
        '/curtidas': (_) => const CurtidasPage(),
        '/upload-musica': (_) => MusicaUploadPage()
      },
    );
  }
}
