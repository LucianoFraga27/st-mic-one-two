import 'package:flutter/material.dart';

class SobreOAPPWiget extends StatelessWidget {
  const SobreOAPPWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:10, left: 10),
      child: Column(
        children: [
          Container(
  width: MediaQuery.of(context).size.width / 1.1,
  height: MediaQuery.of(context).size.height / 4.6,
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(20.0), // Ajuste o valor conforme necessário
  ),
)
        ],
      ),
    );
  }
}