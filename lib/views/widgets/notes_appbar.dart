import 'package:flutter/material.dart';

import 'custom_icon.dart';

class NotesAppbar extends StatelessWidget {
  const NotesAppbar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Spacer(),
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
