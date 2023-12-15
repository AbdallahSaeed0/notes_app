import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';
import 'package:notes_app/views/cubits/cubit/note_cubit.dart';
import 'note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: BlocConsumer<AddnoteCubit, AddnoteState>(
        listener: (context, state) {
          if (state is AddnoteFaliure) {}

          if (state is AddnoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddnoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: NoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
