import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';
import 'package:mic_check_one_two/view/widgets/notificacao_widget.dart';
import 'package:mic_check_one_two/view/widgets/sair_app_widget.dart';



AppBar customAppBar(BuildContext context) {
  ThemeColors themeColors = ThemeColors();

  return AppBar(
    title: Image.asset("assets/onetwo-icone-semfundo.png", width: 45,),
    // const Text("OneTwo", style: TextStyle(fontWeight: FontWeight.w600, color: Color.fromARGB(255, 123, 70, 187),)),
    actions: [
      // _action(
      //   () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return NotificationsDialog();
      //       },
      //     );
      //   },
      //   Icons.notifications_none_outlined,
      // ),
      const SizedBox(width: 10),
      _action(
        () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SairDoAppWidget();
            },
          );
        },
        Icons.logout,
      ),
    ],
    flexibleSpace: Container(
          decoration: BoxDecoration (
          
        ),
        )
  );
}

InkWell _action(onTap, icon) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Icon(icon, size: 25, color: const Color.fromARGB(255, 224, 45, 255),),
    ),
  );
}
