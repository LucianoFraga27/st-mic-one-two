import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/widgets/destaque_topum.dart';
import 'package:mic_check_one_two/view/widgets/prod_audio.dart';
import 'package:mic_check_one_two/view/widgets/destaque_widget.dart';
import 'package:mic_check_one_two/view/widgets/opcoes_widget.dart';
import 'package:mic_check_one_two/view/widgets/recomendados_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                //OpcoesWidget(),
                DestaqueTopUmWidget(),
                OpcoesWidget(),
                const SizedBox(height: 20),
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
