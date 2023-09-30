import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/curtidas_widget.dart';

import '../widgets/app_bar.dart';

class CurtidasPage extends StatefulWidget {
  const CurtidasPage({super.key});

  @override
  State<CurtidasPage> createState() => _CurtidasPageState();
}

class _CurtidasPageState extends State<CurtidasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CurtidasWidget()
            ],
          )),
    );
  }
}
