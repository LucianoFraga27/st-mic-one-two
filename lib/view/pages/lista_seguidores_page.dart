import 'package:flutter/material.dart';

class ListaSeguidoresPage extends StatelessWidget {
  ListaSeguidoresPage({super.key, required this.id});
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seguidores"),),
      body: Container(),
    );
  }
}