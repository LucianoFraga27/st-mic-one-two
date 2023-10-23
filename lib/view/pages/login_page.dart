import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Credentials? _credentials;

  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0('dev-avk6v4jdo8ysj2f1.us.auth0.com',
        'pUtbLry4m9fYywvDGtYFyGIK9MUJRsEY');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_credentials == null)
          ElevatedButton(
              onPressed: () async {
                final credentials = await auth0.webAuthentication().login();

                setState(() {
                  _credentials = credentials;
                });
              },
              child: const Text("Log in"))
      ],
    );
  }
}
