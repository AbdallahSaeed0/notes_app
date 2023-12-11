import 'package:flutter/material.dart';

import 'custom_icon.dart';

class NotesAppbar extends StatelessWidget {
  const NotesAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Notes",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Spacer(),
        CustomIcon()
      ],
    );
  }
}
