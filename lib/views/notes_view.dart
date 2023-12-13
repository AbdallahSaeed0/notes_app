import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/item_note.dart';
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
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (index) {
                return Container(
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        hint: "Title",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hint: "Content",
                        maxlines: 5,
                      ),
                    ],
                  ),
                );
              });
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
            NotesAppbar(),
            SizedBox(
              height: 40,
            ),
            NoteListView()
          ],
        ),
      ),
    );
  }
}
