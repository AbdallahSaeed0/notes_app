import 'package:flutter/material.dart';
import 'widgets/item_note.dart';
import 'widgets/notes_appbar.dart';

class NotesView extends StatelessWidget {
  NotesView({super.key});

  String id = "notesview";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: const Column(
          children: [
            SizedBox(
              height: 50,
            ),
            NotesAppbar(),
            SizedBox(
              height: 40,
            ),
            NoteItem(),
          ],
        ),
      ),
    );
  }
}
