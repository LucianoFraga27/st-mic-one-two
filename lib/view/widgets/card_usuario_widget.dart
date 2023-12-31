import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/pages/perfiL_do_usuario_page.dart';

class CardUsuarioWidget extends StatelessWidget {
  CardUsuarioWidget(
      {super.key,
      required this.capa,
      required this.email,
      required this.id,
      required this.nome});

  String capa;
  String nome;
  String email;
  String id;

  @override
  Widget build(BuildContext context) {
    log(capa);
    return InkWell(
      onTap: () {
        print("go to usuario: $nome $id");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PerfilDoUsuarioPage(id: int.parse(id)),)
        );

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 190, 150, 240),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 223, 216, 216),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(1, 2))
            ]),
        child:  ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(capa),
          ),
          title: Text("$nome"),
          subtitle: Text("$email"),
        ),
      ),
    );
  }
}
