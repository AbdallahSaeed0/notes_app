import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/cubits/cubit/note_cubit.dart';
import 'package:notes_app/views/models/note_model.dart';
import 'package:notes_app/views/widgets/notes_appbar.dart';

import 'widgets/custom_text_field.dart';

class NoteEditView extends StatefulWidget {
  const NoteEditView({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteEditView> createState() => _NoteEditViewState();
}

class _NoteEditViewState extends State<NoteEditView> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            NotesAppbar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = subtitle ?? widget.note.content;
                BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              hint: widget.note.title,
              onchanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: widget.note.content,
              maxlines: 5,
              onchanged: (value) {
                subtitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
