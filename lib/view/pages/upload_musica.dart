import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';
import 'package:mic_check_one_two/domain/repository/musica/repository/musica_add_repository.dart';
import 'package:mic_check_one_two/domain/repository/musica/repository/musica_add_repository_impl.dart';

class MusicaUploadPage extends StatefulWidget {
  @override
  _MusicaUploadPageState createState() => _MusicaUploadPageState();
}

class _MusicaUploadPageState extends State<MusicaUploadPage> {
  late ImagePicker _imagePicker;
  XFile? _selectedImage;
  int _currentStep = 0;
  TextEditingController tituloController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  GeneroMusical selectedGenero = GeneroMusical.ALTERNATIVE;
  File? audioFile;
   late MusicaAddRepository musicaAddRepository;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    musicaAddRepository = MusicaAddRepository(); // Inicialização aqui
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload de Música'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        onStepContinue: () async {
          if (_currentStep < 3) {
            if (_currentStep == 0) {
              if (tituloController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erro'),
                      content: Text('Por favor, informe o título da música.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
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
            } else if (_currentStep == 1) {
              if (_selectedImage == null || _selectedImage!.path.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erro'),
                      content:
                          Text('Por favor, selecione uma capa para a música.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
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
            } else if (_currentStep == 2) {
              if (audioFile == null || audioFile!.path.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erro'),
                      content: Text(
                          'Por favor, selecione um arquivo de áudio para a música.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
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
            } else if (_currentStep == 3) {
              if (selectedGenero == null) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Erro'),
                      content: Text('Por favor, selecione o gênero da música.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
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
            }
          } else {
            print("Conclui cadastro");
            await musicaAddRepository.adicionarMusica(tituloController.text,
      audioFile!,
      _selectedImage!,
      selectedGenero);
          }
        },
        steps: [
          Step(
            title: Text('Título da Música'),
            content: TextFormField(
              controller: tituloController,
              decoration:
                  InputDecoration(labelText: 'Informe o título da música'),
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('Capa da Música'),
            content: Column(
              children: <Widget>[
                Text(
                  'Escolha a capa da música',
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
                          border: Border.all(
                            color: Colors.blue,
                            width: 3,
                          ),
                        ),
                        child: _selectedImage != null
                            ? ClipRect(
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
            title: Text('Áudio MP3 da Música'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aqui você pode fazer o upload do áudio em MP3 da música.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                audioFile != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Arquivo selecionado:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            audioFile!.path.split('/').last,
                            // Exibe apenas o nome do arquivo, removendo o caminho
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['mp3'],
                          );

                          if (result != null) {
                            print(
                                'Arquivo selecionado: ${result.files.single.name}');
                            setState(() {
                              audioFile = File(result.files.single.path ?? "");
                            });
                          } else {
                            print('Nenhum arquivo selecionado');
                          }
                        },
                        child: Text('Selecionar Áudio MP3 da Música'),
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
        ],
      ),
    );
  }
}
