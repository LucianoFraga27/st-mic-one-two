import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/destaque_topum.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';
import 'package:mic_check_one_two/view/widgets/destaque_widget.dart';
import 'package:mic_check_one_two/view/widgets/opcoes_widget.dart';
import 'package:mic_check_one_two/view/widgets/recomendados_widget.dart';
import 'package:mic_check_one_two/view/widgets/sobre_o_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade100,
        width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                SobreOAPPWiget(),
                const SizedBox(height: 20),
                OpcoesWidget(),
                DestaqueWidget(),
                const SizedBox(height: 15),
                
                // const SizedBox(height: 20),
                // DestaqueTopUmWidget(),
                RecomendadosWidget(),
                
                
                const SizedBox(height: 0),
                // CurtidasWidget(),
                const SizedBox(height: 30),
                //const SizedBox(height: 20),
                // DestaqueWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
