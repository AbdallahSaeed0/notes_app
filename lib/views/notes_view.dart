import 'package:flutter/material.dart';
import 'package:notes_app/views/constants.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/modal_bottom_sheet.dart';
import 'widgets/note_list_view.dart';
import 'widgets/notes_appbar.dart';

class NotesView extends StatelessWidget {
  NotesView({super.key});

  String id = "notesview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            NotesAppbar(
              title: "Note",
              icon: Icons.search,
            ),
            SizedBox(
              height: 40,
            ),
            NoteListView(),
          ],
        ),
      ),
    );
  }
}
