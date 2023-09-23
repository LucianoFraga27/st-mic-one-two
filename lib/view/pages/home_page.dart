import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/destaque_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Column(
            children: [const SizedBox(height: 20), DestaqueWidget()],
          )
        ],
      ),
    );
  }
}
