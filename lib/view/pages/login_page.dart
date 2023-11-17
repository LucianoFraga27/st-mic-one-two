import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_temp.dart';
import 'package:mic_check_one_two/domain/repository/login/vm/login_vm.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final userNameController = TextEditingController(text: "a@email.com");

  final userPasswordController = TextEditingController(text: "12345");
  late SharedPreferences sp;
  late LoginRepositoryTemp loginRepository;

   _initialize() async {
    sp = await SharedPreferences.getInstance();
    loginRepository = LoginRepositoryTemp();
  }
  @override
  void initState()  {
    super.initState();
    _initialize();
  }
  ThemeColors themeColors = ThemeColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: themeColors.login
          
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              Image.asset(
                'assets/onetwo-icone-semfundo.png', // Adicione o caminho da imagem aqui
                width: 250, // Defina o tamanho da imagem
                height: 250,
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: userPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  gradient: themeColors.loginbtn,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    bool isLoading = true;
                    bool login = false;

                    // Mostrar o indicador de carregamento
                    setState(() {
                      isLoading = true;
                    });

                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          child: Center(
                            child:
                                CircularProgressIndicator(), // Indicador de carregamento
                          ),
                        );
                      },
                    );

                    // Aguardar 2 segundos (simulando um atraso)
                    List results = await Future.wait([
                      Future.delayed(Duration(
                          seconds:
                              2)), // Aguardar 2 segundos (simulando um atraso)
                      loginRepository.login(
                          userNameController.text, userPasswordController.text),
                    ]);
                    // Fechar o indicador de carregamento
                    Navigator.of(context).pop();

                    // Executar a solicitação de login

                    if (results[1]) {

                      
                     final username = sp.getString(LocalStorageKeys.usernameUsuario);

                      print(username);
                      if(username == 'null') {
                        Navigator.pushNamedAndRemoveUntil(
                          context, "/adicionar-dadospessoais", (route) => false);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                          context, "/home", (route) => false);
                      }

                      
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Login Inválido"),
                            content: Text(
                                "Por favor, verifique suas credenciais e tente novamente."),
                            actions: <Widget>[
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
