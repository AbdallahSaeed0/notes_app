import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/cubits/cubit/note_cubit.dart';
import 'package:notes_app/views/models/note_model.dart';

import 'item_note.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];

        return Expanded(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: NoteItem(),
                );
              }),
        );
      },
    );
  }
}
