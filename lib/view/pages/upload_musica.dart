import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mic_check_one_two/domain/model/genero_musical.dart';

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
  GeneroMusical? selectedGenero;
  File? audioFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        onStepContinue: () {
          if (_currentStep < 3) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            // Lógica para concluir e enviar
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
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
    children: [
      Text(
        'Aqui você pode fazer o upload do áudio em MP3 da música.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 10),
      audioFile != null
          ? Text(audioFile!.path) // Exibir o caminho do arquivo selecionado
          : Placeholder(
              fallbackHeight: 50,
            ),
     ElevatedButton(
  onPressed: () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      print('Arquivo selecionado: ${result.files.single.name}');
      setState(() {
        audioFile = File(result.files.single.path ?? "");
      });
    } else {
      print('Nenhum arquivo selecionado');
    }
  },
  child: Text('Selecionar Áudio MP3 da Música'),
)
    ],
  ),
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
                      value: selectedGenero,
                      onChanged: (GeneroMusical? newValue) {
                        setState(() {
                          selectedGenero = newValue;
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
          )
        ],
      ),
    );
  }
}
