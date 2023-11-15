import 'package:flutter/material.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_temp.dart';
import 'package:mic_check_one_two/view/pages/login_page.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailEC = TextEditingController();

  TextEditingController pass_1_EC = TextEditingController();
  TextEditingController pass_2_EC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late LoginRepositoryTemp loginRepository;
  
  @override
  void initState() {
    loginRepository = LoginRepositoryTemp();
    super.initState();
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
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40),
                Image.asset(
                   'assets/onetwo-icone-semfundo.png',  // Adicione o caminho da imagem aqui
                  width: 250, // Defina o tamanho da imagem
                  height: 250,
                ),
                SizedBox(height: 16),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email inválido'),
                  ]),
                  controller: emailEC,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha é obrigatória'),
                    Validatorless.min(
                        5, 'A senha deve conter no mínimo 5 caracteres')
                  ]),
                  controller: pass_1_EC,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirmar senha é obrigatório'),
                    Validatorless.compare(pass_1_EC, pass_2_EC.text)
                  ]),
                  controller: pass_2_EC,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient:themeColors.loginbtn,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Mostrar o indicador de carregamento
                      if (formKey.currentState!.validate()) {
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

                      bool registrationSuccessful = await loginRepository
                          .register(emailEC.text, pass_1_EC.text);

                      // Fechar o indicador de carregamento
                      Navigator.pop(context);

                      if (registrationSuccessful) {
                        // Registro bem-sucedido
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Registro Bem Sucedido'),
                              content: Text(
                                  'Você foi registrado com sucesso!\nRealize login para validar seu registro.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Fecha o alerta
                                    // Redireciona para a tela de login
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Exibir mensagem de erro
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Erro no Registro'),
                              content: Text(
                                  'O registro falhou. Por favor, verifique suas informações e tente novamente inserindo um novo email.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Fecha o alerta
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
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
                      'Registrar',
                      style: TextStyle(
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Ação para o link "Já tem uma conta? Faça login"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Já tem uma conta? Faça login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
