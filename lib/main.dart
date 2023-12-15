import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/views/cubits/cubit/addnote_cubit.dart';
import 'package:notes_app/views/models/note_model.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/simble_bloc_obs.dart';

import 'views/constants.dart';
import 'views/cubits/cubit/note_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObServer();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesbox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          NotesView().id: (context) => NotesView(),
        },
        initialRoute: NotesView().id,
      ),
    );
  }
}
