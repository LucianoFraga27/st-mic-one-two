import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';
import 'package:mic_check_one_two/domain/repository/login/login_repository_temp.dart';
import 'package:mic_check_one_two/domain/repository/usuario/usuario_repository_temp.dart';
import 'package:mic_check_one_two/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendUsernameAndImagePage extends StatefulWidget {
  @override
  _SendUsernameAndImagePageState createState() =>
      _SendUsernameAndImagePageState();
}

class _SendUsernameAndImagePageState extends State<SendUsernameAndImagePage> {
  late ImagePicker _imagePicker;
  XFile? _selectedImage;
  TextEditingController _usernameController = TextEditingController();
  int _currentStep = 0;
  bool _acceptedTerms = false;
  late UsuarioRepositoryTemp usuarioRepositoryTemp;
  late SharedPreferences sp;
  String id = "0";
  bool isLoading = false;

  _asyncCarregar() async {
    sp = await SharedPreferences.getInstance();
    id = sp.getString(LocalStorageKeys.idUsuario) ?? "0";
    usuarioRepositoryTemp = UsuarioRepositoryTemp();
  }

  @override
  void initState() {
    super.initState();
    _asyncCarregar();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  GeneroMusical selectedGenero = GeneroMusical.FUNK;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OneTwo'),
      ),
      body: Stack(
        children: [
          Stepper(
            type: StepperType.vertical,
            steps: _buildSteps(),
            currentStep: _currentStep,
            onStepContinue: () {
              if (_acceptedTerms == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Termos de Uso'),
                      content: Text(
                        'É obrigatório aceitar os termos de uso para acessar o aplicativo.',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (_currentStep < _buildSteps().length - 1) {
                if (_currentStep == 3 && _usernameController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Nome Artístico'),
                        content: Text(
                          'É obrigatório informar um nome artístico.',
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  setState(() {
                    _currentStep += 1;
                  });
                }
              } else {
                // Exibe o indicador de carregamento e processa o envio após o último passo.
                setState(() {
                  isLoading = true;
                });
                _onFinalizarCadastro(
                    _usernameController.text, _selectedImage, id);
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(color:Color.fromARGB(255, 182, 123, 255)),
              ),
            ),
        ],
      ),
    );
  }

  void _onFinalizarCadastro(
      String username, XFile? fotoPerfil, String id) async {
    try {
      final success = await usuarioRepositoryTemp.addUsernameAndFoto(
          username, fotoPerfil, id, selectedGenero);

      if (success) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro no cadastro'),
              content: Text(
                  'Ocorreu um erro ao concluir o cadastro, tente novamente mais tarde.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, "/login", (route) => false);
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Erro: $e");
    } finally {
      // Defina isLoading como falso após a conclusão, independentemente do resultado.
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: Text('Termos de Uso'),
        content: Column(
          children: <Widget>[
            Text(
              'Termos de Uso do OneTwo\n\n'
              'Bem-vindo ao OneTwo! Ao usar nosso aplicativo, você concorda com os seguintes termos de uso:\n\n'
              '1. Uso Responsável\n'
              'Você concorda em usar este aplicativo de forma responsável e respeitar as leis e regulamentos locais.\n\n'
              '2. Conteúdo\n'
              'Você é responsável pelo conteúdo que você cria e compartilha no aplicativo. Não é permitido compartilhar conteúdo que seja ilegal ou que viole os direitos autorais de terceiros.\n\n'
              '3. Privacidade\n'
              'Valorizamos sua privacidade. Não compartilharemos suas informações pessoais com terceiros sem seu consentimento.\n\n'
              '4. Atualizações\n'
              'O aplicativo pode ser atualizado periodicamente para adicionar novos recursos ou corrigir problemas. Certifique-se de manter o aplicativo atualizado para ter a melhor experiência possível.\n\n'
              '5. Encerramento da Conta\n'
              'Reservamo-nos o direito de encerrar ou suspender sua conta se você violar estes termos de uso.\n\n'
              'Ao usar o OneTwo, você concorda com estes termos de uso. Se você não concorda com eles, por favor, desinstale o aplicativo.\n\n'
              'Obrigado por usar o OneTwo!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _acceptedTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptedTerms = value!;
                    });
                  },
                ),
                Text('Concordo com os termos de uso'),
              ],
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Foto de Perfil'),
        content: Column(
          children: <Widget>[
            Text(
              'SELECIONE IMAGEM DE PERFIL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    child: _selectedImage != null
                        ? ClipOval(
                            child: Image.file(
                              File(_selectedImage!.path),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Nome Artístico'),
        content: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Nome artístico',
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
       Step(
            title: Text('Gênero da Música'),
            content: Column(
              children: [
                Text(
                  'Selecione o Gênero da Música',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButton<GeneroMusical>(
                      value: selectedGenero ?? GeneroMusical.ALTERNATIVE,
                      onChanged: (GeneroMusical? newValue) {
                        setState(() {
                          selectedGenero = newValue ?? GeneroMusical.ALTERNATIVE;
                        });
                      },
                      items: GeneroMusical.values
                          .map<DropdownMenuItem<GeneroMusical>>(
                        (GeneroMusical value) {
                          
                          return DropdownMenuItem<GeneroMusical>(
                            value: value,
                            child: Text(value.toString().split('.').last),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ],
            ),
            isActive: _currentStep >= 3,
          )
    ];
  }
}
