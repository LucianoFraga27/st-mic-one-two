import 'package:flutter/material.dart';
import 'package:mic_check_one_two/view/theme.dart';

ThemeColors themeColors = ThemeColors();

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: const Text("OneTwo", style: TextStyle(fontWeight: FontWeight.w600)),
    actions: [
      _action(() {}, Icons.cloud_upload_outlined),
      const SizedBox(width: 10),
      _action(() {}, Icons.email_outlined),
      const SizedBox(width: 10),
      _action(() {}, Icons.notifications_none_outlined),
      const SizedBox(width: 10),
    ],
  );
}

InkWell _action(onTap, icon) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Icon(icon, size: 25),
    ),
  );
}
