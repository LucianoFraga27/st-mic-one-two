import 'package:flutter/material.dart';
import 'package:mic_check_one_two/domain/model/notification_card_model.dart';

class NotificationsDialog extends StatefulWidget {
  @override
  _NotificationsDialogState createState() => _NotificationsDialogState();
}

class _NotificationsDialogState extends State<NotificationsDialog> {
  final List<NotificationCard> notifications = [
    NotificationCard(
        Icons.favorite, 'Carlos curtiu sua faixa: "De Manhã"', "Curtida"),
    NotificationCard(
        Icons.person_add, 'Matheus começou a te seguir', "Seguidor"),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent, // Tornar o fundo transparente
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white, // Cor do fundo do diálogo
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Notificações',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey, // Cor da linha separadora
              height: 1.0,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: notifications.map((notification) {
                  return ListTile(
                    leading: Icon(notification.icon),
                    title: Text(notification.title),
                    subtitle: Text(notification.message),
                  );
                }).toList(),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Fechar',
                style: TextStyle(color: const Color.fromARGB(255, 53, 53, 53)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
