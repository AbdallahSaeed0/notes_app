import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_appbar.dart';

import 'widgets/custom_text_field.dart';

class NoteEditView extends StatelessWidget {
  const NoteEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            NotesAppbar(title: 'Edit Note', icon: Icons.check),
            SizedBox(
              height: 40,
            ),
            CustomTextField(hint: "Title"),
            SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: "Content",
              maxlines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
