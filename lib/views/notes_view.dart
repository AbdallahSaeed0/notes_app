import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cubit/note_cubit.dart';
import 'widgets/modal_bottom_sheet.dart';
import 'widgets/note_list_view.dart';
import 'widgets/notes_appbar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  final String id = "notesview";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
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
      ),
    );
  }
}
